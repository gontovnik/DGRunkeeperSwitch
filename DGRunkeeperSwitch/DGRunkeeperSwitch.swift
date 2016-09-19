//
//  DGRunkeeperSwitch.swift
//  DGRunkeeperSwitchExample
//
//  Created by Danil Gontovnik on 9/3/15.
//  Copyright © 2015 Danil Gontovnik. All rights reserved.
//

import UIKit

// MARK: - DGRunkeeperSwitchRoundedLayer

open class DGRunkeeperSwitchRoundedLayer: CALayer {

    override open var bounds: CGRect {
        didSet { cornerRadius = bounds.height / 2.0 }
    }
    
}

// MARK: - DGRunkeeperSwitch


@IBDesignable
open class DGRunkeeperSwitch: UIControl {
    
    // MARK: - Public vars
    
    open var titles: [String] {
        set {
            (titleLabels + selectedTitleLabels).forEach { $0.removeFromSuperview() }
            titleLabels = newValue.map { title in
                let label = UILabel()
                label.text = title
                label.textColor = titleColor
                label.font = titleFont
                label.textAlignment = .center
                label.lineBreakMode = .byTruncatingTail
                titleLabelsContentView.addSubview(label)
                return label
            }
            selectedTitleLabels = newValue.map { title in
                let label = UILabel()
                label.text = title
                label.textColor = selectedTitleColor
                label.font = titleFont
                label.textAlignment = .center
                label.lineBreakMode = .byTruncatingTail
                selectedTitleLabelsContentView.addSubview(label)
                return label
            }
        }
        get { return titleLabels.map { $0.text! } }
    }
    
    fileprivate(set) open var selectedIndex: Int = 0
    
    open var selectedBackgroundInset: CGFloat = 2.0 {
        didSet { setNeedsLayout() }
    }
    
    @IBInspectable
    open var selectedBackgroundColor: UIColor! {
        set { selectedBackgroundView.backgroundColor = newValue }
        get { return selectedBackgroundView.backgroundColor }
    }
    
    @IBInspectable
    open var titleColor: UIColor! {
        didSet { titleLabels.forEach { $0.textColor = titleColor } }
    }
    
    @IBInspectable
    open var selectedTitleColor: UIColor! {
        didSet { selectedTitleLabels.forEach { $0.textColor = selectedTitleColor } }
    }
    
    open var titleFont: UIFont! {
        didSet { (titleLabels + selectedTitleLabels).forEach { $0.font = titleFont } }
    }
    
    @IBInspectable
    open var titleFontFamily: String = "HelveticaNeue"
    
    @IBInspectable
    open var titleFontSize: CGFloat = 18.0
    
    open var animationDuration: TimeInterval = 0.3
    open var animationSpringDamping: CGFloat = 0.75
    open var animationInitialSpringVelocity: CGFloat = 0.0
    
    // MARK: - Private vars
    
    fileprivate var titleLabelsContentView = UIView()
    fileprivate var titleLabels = [UILabel]()
    
    fileprivate var selectedTitleLabelsContentView = UIView()
    fileprivate var selectedTitleLabels = [UILabel]()
    
    fileprivate(set) var selectedBackgroundView = UIView()
    
    fileprivate var titleMaskView: UIView = UIView()
    
    fileprivate var tapGesture: UITapGestureRecognizer!
    fileprivate var panGesture: UIPanGestureRecognizer!
    
    fileprivate var initialSelectedBackgroundViewFrame: CGRect?
    
    // MARK: - Constructors
    
    public init(titles: [String]) {
        super.init(frame: CGRect.zero)
        
        self.titles = titles
        
        finishInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        finishInit()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        finishInit()
        backgroundColor = .black // don't set background color in finishInit(), otherwise IB settings which are applied in init?(coder:) are overwritten
    }
    
    fileprivate func finishInit() {
        // Setup views
        addSubview(titleLabelsContentView)
        
        object_setClass(selectedBackgroundView.layer, DGRunkeeperSwitchRoundedLayer.self)
        addSubview(selectedBackgroundView)
        
        addSubview(selectedTitleLabelsContentView)
        
        object_setClass(titleMaskView.layer, DGRunkeeperSwitchRoundedLayer.self)
        titleMaskView.backgroundColor = .black
        selectedTitleLabelsContentView.layer.mask = titleMaskView.layer
        
        // Setup defaul colors
        if backgroundColor == nil {
            backgroundColor = .black
        }
        
        selectedBackgroundColor = .white
        titleColor = .white
        selectedTitleColor = .black
      
        // Gestures
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        addGestureRecognizer(tapGesture)
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(pan))
        panGesture.delegate = self
        addGestureRecognizer(panGesture)
        
        addObserver(self, forKeyPath: "selectedBackgroundView.frame", options: .new, context: nil)
    }
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        
        self.titleFont = UIFont(name: self.titleFontFamily, size: self.titleFontSize)
    }
    
    // MARK: - Destructor
    
    deinit {
        removeObserver(self, forKeyPath: "selectedBackgroundView.frame")
    }
    
    // MARK: - Observer
    
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "selectedBackgroundView.frame" {
            titleMaskView.frame = selectedBackgroundView.frame
        }
    }
    
    // MARK: -
    
    override open class var layerClass : AnyClass {
        return DGRunkeeperSwitchRoundedLayer.self
    }
    
    func tapped(_ gesture: UITapGestureRecognizer!) {
        let location = gesture.location(in: self)
        let index = Int(location.x / (bounds.width / CGFloat(titleLabels.count)))
        setSelectedIndex(index, animated: true)
    }
    
    func pan(_ gesture: UIPanGestureRecognizer!) {
        if gesture.state == .began {
            initialSelectedBackgroundViewFrame = selectedBackgroundView.frame
        } else if gesture.state == .changed {
            var frame = initialSelectedBackgroundViewFrame!
            frame.origin.x += gesture.translation(in: self).x
            frame.origin.x = max(min(frame.origin.x, bounds.width - selectedBackgroundInset - frame.width), selectedBackgroundInset)
            selectedBackgroundView.frame = frame
        } else if gesture.state == .ended || gesture.state == .failed || gesture.state == .cancelled {
            let index = max(0, min(titleLabels.count - 1, Int(selectedBackgroundView.center.x / (bounds.width / CGFloat(titleLabels.count)))))
            setSelectedIndex(index, animated: true)
        }
    }
    
    open func setSelectedIndex(_ selectedIndex: Int, animated: Bool) {
        guard 0..<titleLabels.count ~= selectedIndex else { return }
        
        // Reset switch on half pan gestures
        var catchHalfSwitch = false
        if self.selectedIndex == selectedIndex {
            catchHalfSwitch = true
        }
        
        self.selectedIndex = selectedIndex
        if animated {
            if (!catchHalfSwitch) {
                self.sendActions(for: .valueChanged)
            }
            UIView.animate(withDuration: animationDuration, delay: 0.0, usingSpringWithDamping: animationSpringDamping, initialSpringVelocity: animationInitialSpringVelocity, options: [UIViewAnimationOptions.beginFromCurrentState, UIViewAnimationOptions.curveEaseOut], animations: { () -> Void in
                self.layoutSubviews()
                }, completion: nil)
        } else {
            layoutSubviews()
            sendActions(for: .valueChanged)
        }
    }
    
    // MARK: - Layout
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        let selectedBackgroundWidth = bounds.width / CGFloat(titleLabels.count) - selectedBackgroundInset * 2.0
        selectedBackgroundView.frame = CGRect(x: selectedBackgroundInset + CGFloat(selectedIndex) * (selectedBackgroundWidth + selectedBackgroundInset * 2.0), y: selectedBackgroundInset, width: selectedBackgroundWidth, height: bounds.height - selectedBackgroundInset * 2.0)
        
        (titleLabelsContentView.frame, selectedTitleLabelsContentView.frame) = (bounds, bounds)
        
        let titleLabelMaxWidth = selectedBackgroundWidth
        let titleLabelMaxHeight = bounds.height - selectedBackgroundInset * 2.0
        
        zip(titleLabels, selectedTitleLabels).forEach { label, selectedLabel in
            let index = titleLabels.index(of: label)!
            
            var size = label.sizeThatFits(CGSize(width: titleLabelMaxWidth, height: titleLabelMaxHeight))
            size.width = min(size.width, titleLabelMaxWidth)
          
            let x = floor((bounds.width / CGFloat(titleLabels.count)) * CGFloat(index) + (bounds.width / CGFloat(titleLabels.count) - size.width) / 2.0)
            let y = floor((bounds.height - size.height) / 2.0)
            let origin = CGPoint(x: x, y: y)
            
            let frame = CGRect(origin: origin, size: size)
            label.frame = frame
            selectedLabel.frame = frame
        }
    }
    
}

// MARK: - UIGestureRecognizerDelegate

extension DGRunkeeperSwitch: UIGestureRecognizerDelegate {
    
    override open func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == panGesture {
            return selectedBackgroundView.frame.contains(gestureRecognizer.location(in: self))
        }
        return super.gestureRecognizerShouldBegin(gestureRecognizer)
    }
    
}
