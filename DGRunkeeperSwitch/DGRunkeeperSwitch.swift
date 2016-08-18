//
//  DGRunkeeperSwitch.swift
//  DGRunkeeperSwitchExample
//
//  Created by Danil Gontovnik on 9/3/15.
//  Copyright © 2015 Danil Gontovnik. All rights reserved.
//

import UIKit

// MARK: -
// MARK: DGRunkeeperSwitchRoundedLayer

public class DGRunkeeperSwitchRoundedLayer: CALayer {

    override public var bounds: CGRect {
        didSet { cornerRadius = bounds.height / 2.0 }
    }
    
}

// MARK: -
// MARK: DGRunkeeperSwitch


@IBDesignable
public class DGRunkeeperSwitch: UIControl {
    
    // MARK: -
    // MARK: Public vars
    
    public var titles: [String] {
        set {
            (titleLabels + selectedTitleLabels).forEach { $0.removeFromSuperview() }
            titleLabels = newValue.map { title in
                let label = UILabel()
                label.text = title
                label.textColor = titleColor
                label.font = titleFont
                label.textAlignment = .Center
                label.lineBreakMode = .ByTruncatingTail
                titleLabelsContentView.addSubview(label)
                return label
            }
            selectedTitleLabels = newValue.map { title in
                let label = UILabel()
                label.text = title
                label.textColor = selectedTitleColor
                label.font = titleFont
                label.textAlignment = .Center
                label.lineBreakMode = .ByTruncatingTail
                selectedTitleLabelsContentView.addSubview(label)
                return label
            }
        }
        get { return titleLabels.map { $0.text! } }
    }
    
    private(set) public var selectedIndex: Int = 0
    
    public var selectedBackgroundInset: CGFloat = 2.0 {
        didSet { setNeedsLayout() }
    }
    
    @IBInspectable
    public var selectedBackgroundColor: UIColor! {
        set { selectedBackgroundView.backgroundColor = newValue }
        get { return selectedBackgroundView.backgroundColor }
    }
    
    @IBInspectable
    public var titleColor: UIColor! {
        didSet { titleLabels.forEach { $0.textColor = titleColor } }
    }
    
    @IBInspectable
    public var selectedTitleColor: UIColor! {
        didSet { selectedTitleLabels.forEach { $0.textColor = selectedTitleColor } }
    }
    
    public var titleFont: UIFont! {
        didSet { (titleLabels + selectedTitleLabels).forEach { $0.font = titleFont } }
    }
    
<<<<<<< HEAD
    public var animationDuration: TimeInterval = 0.3
=======
    @IBInspectable
    public var titleFontFamily: String = "HelveticaNeue"
    
    @IBInspectable
    public var titleFontSize: CGFloat = 18.0
    
    public var animationDuration: NSTimeInterval = 0.3
>>>>>>> gontovnik/master
    public var animationSpringDamping: CGFloat = 0.75
    public var animationInitialSpringVelocity: CGFloat = 0.0
    
    // MARK: -
    // MARK: Private vars
    
    private var titleLabelsContentView = UIView()
    private var titleLabels = [UILabel]()
    
    private var selectedTitleLabelsContentView = UIView()
    private var selectedTitleLabels = [UILabel]()
    
    private(set) var selectedBackgroundView = UIView()
    
    private var titleMaskView: UIView = UIView()
    
    private var tapGesture: UITapGestureRecognizer!
    private var panGesture: UIPanGestureRecognizer!
    
    private var initialSelectedBackgroundViewFrame: CGRect?
    
    // MARK: -
    // MARK: Constructors
    
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
        backgroundColor = .black() // don't set background color in finishInit(), otherwise IB settings which are applied in init?(coder:) are overwritten
    }
    
    private func finishInit() {
        // Setup views
<<<<<<< HEAD
        (leftTitleLabel.lineBreakMode, rightTitleLabel.lineBreakMode) = (.byTruncatingTail, .byTruncatingTail)
        
        titleLabelsContentView.addSubview(leftTitleLabel)
        titleLabelsContentView.addSubview(rightTitleLabel)
=======
>>>>>>> gontovnik/master
        addSubview(titleLabelsContentView)
        
        object_setClass(selectedBackgroundView.layer, DGRunkeeperSwitchRoundedLayer.self)
        addSubview(selectedBackgroundView)
        
        addSubview(selectedTitleLabelsContentView)
        
<<<<<<< HEAD
        (leftTitleLabel.textAlignment, rightTitleLabel.textAlignment, selectedLeftTitleLabel.textAlignment, selectedRightTitleLabel.textAlignment) = (.center, .center, .center, .center)
        
=======
>>>>>>> gontovnik/master
        object_setClass(titleMaskView.layer, DGRunkeeperSwitchRoundedLayer.self)
        titleMaskView.backgroundColor = .black()
        selectedTitleLabelsContentView.layer.mask = titleMaskView.layer
        
        // Setup defaul colors
<<<<<<< HEAD
        selectedBackgroundColor = .white()
        titleColor = .white()
        selectedTitleColor = .black()
        
        // Gestures
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(DGRunkeeperSwitch.tapped(_:)))
        addGestureRecognizer(tapGesture)
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(DGRunkeeperSwitch.pan(_:)))
=======
        if backgroundColor == nil {
            backgroundColor = .blackColor()
        }
        
        selectedBackgroundColor = .whiteColor()
        titleColor = .whiteColor()
        selectedTitleColor = .blackColor()
        
        // Gestures
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        addGestureRecognizer(tapGesture)
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(pan))
>>>>>>> gontovnik/master
        panGesture.delegate = self
        addGestureRecognizer(panGesture)
        
        addObserver(self, forKeyPath: "selectedBackgroundView.frame", options: .new, context: nil)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        self.titleFont = UIFont(name: self.titleFontFamily, size: self.titleFontSize)
    }
    
    // MARK: -
    // MARK: Destructor
    
    deinit {
        removeObserver(self, forKeyPath: "selectedBackgroundView.frame")
    }
    
    // MARK: -
    // MARK: Observer
    
    override public func observeValue(forKeyPath keyPath: String?, of object: AnyObject?, change: [NSKeyValueChangeKey : AnyObject]?, context: UnsafeMutablePointer<Void>?) {
        if keyPath == "selectedBackgroundView.frame" {
            titleMaskView.frame = selectedBackgroundView.frame
        }
    }
    
    // MARK: -
    
    override public class func layerClass() -> AnyClass {
        return DGRunkeeperSwitchRoundedLayer.self
    }
    
<<<<<<< HEAD
    func tapped(_ gesture: UITapGestureRecognizer!) {
        let location = gesture.location(in: self)
        if location.x < bounds.width / 2.0 {
            setSelectedIndex(0, animated: true)
        } else {
            setSelectedIndex(1, animated: true)
        }
=======
    func tapped(gesture: UITapGestureRecognizer!) {
        let location = gesture.locationInView(self)
        let index = Int(location.x / (bounds.width / CGFloat(titleLabels.count)))
        setSelectedIndex(index, animated: true)
>>>>>>> gontovnik/master
    }
    
    func pan(_ gesture: UIPanGestureRecognizer!) {
        if gesture.state == .began {
            initialSelectedBackgroundViewFrame = selectedBackgroundView.frame
        } else if gesture.state == .changed {
            var frame = initialSelectedBackgroundViewFrame!
            frame.origin.x += gesture.translation(in: self).x
            frame.origin.x = max(min(frame.origin.x, bounds.width - selectedBackgroundInset - frame.width), selectedBackgroundInset)
            selectedBackgroundView.frame = frame
<<<<<<< HEAD
        } else if gesture.state == .ended || gesture.state == .failed || gesture.state == .cancelled {
            let velocityX = gesture.velocity(in: self).x
            if velocityX > 500.0 {
                setSelectedIndex(1, animated: true)
            } else if velocityX < -500.0 {
                setSelectedIndex(0, animated: true)
            } else if selectedBackgroundView.center.x >= bounds.width / 2.0 {
                setSelectedIndex(1, animated: true)
            } else if selectedBackgroundView.center.x < bounds.size.width / 2.0 {
                setSelectedIndex(0, animated: true)
            }
        }
    }
    
    public func setSelectedIndex(_ selectedIndex: Int, animated: Bool) {
=======
        } else if gesture.state == .Ended || gesture.state == .Failed || gesture.state == .Cancelled {
            let index = max(0, min(titleLabels.count - 1, Int(selectedBackgroundView.center.x / (bounds.width / CGFloat(titleLabels.count)))))
            setSelectedIndex(index, animated: true)
        }
    }
    
    public func setSelectedIndex(selectedIndex: Int, animated: Bool) {
        guard 0..<titleLabels.count ~= selectedIndex else { return }
>>>>>>> gontovnik/master
        
        // Reset switch on half pan gestures
        var catchHalfSwitch:Bool = false
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
    
    // MARK: -
    // MARK: Layout
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        let selectedBackgroundWidth = bounds.width / CGFloat(titleLabels.count) - selectedBackgroundInset * 2.0
        selectedBackgroundView.frame = CGRect(x: selectedBackgroundInset + CGFloat(selectedIndex) * (selectedBackgroundWidth + selectedBackgroundInset * 2.0), y: selectedBackgroundInset, width: selectedBackgroundWidth, height: bounds.height - selectedBackgroundInset * 2.0)
        
        (titleLabelsContentView.frame, selectedTitleLabelsContentView.frame) = (bounds, bounds)
        
        let titleLabelMaxWidth = selectedBackgroundWidth
        let titleLabelMaxHeight = bounds.height - selectedBackgroundInset * 2.0
        
<<<<<<< HEAD
        var leftTitleLabelSize = leftTitleLabel.sizeThatFits(CGSize(width: titleLabelMaxWidth, height: titleLabelMaxHeight))
        leftTitleLabelSize.width = min(leftTitleLabelSize.width, titleLabelMaxWidth)
        
        let leftTitleLabelOrigin = CGPoint(x: floor((bounds.width / 2.0 - leftTitleLabelSize.width) / 2.0), y: floor((bounds.height - leftTitleLabelSize.height) / 2.0))
        let leftTitleLabelFrame = CGRect(origin: leftTitleLabelOrigin, size: leftTitleLabelSize)
        (leftTitleLabel.frame, selectedLeftTitleLabel.frame) = (leftTitleLabelFrame, leftTitleLabelFrame)
        
        var rightTitleLabelSize = rightTitleLabel.sizeThatFits(CGSize(width: titleLabelMaxWidth, height: titleLabelMaxHeight))
        rightTitleLabelSize.width = min(rightTitleLabelSize.width, titleLabelMaxWidth)
        
        var rightTitleLabelOriginXPosition = bounds.size.width / 2.0
        rightTitleLabelOriginXPosition += bounds.width / 2.0 - rightTitleLabelSize.width
        rightTitleLabelOriginXPosition = floor(rightTitleLabelOriginXPosition / 2)
        let rightTitleLabelOriginYPosition = floor((bounds.height - rightTitleLabelSize.height) / 2.0)
        let rightTitleLabelOrigin = CGPoint(x: rightTitleLabelOriginXPosition, y: rightTitleLabelOriginYPosition)
        let rightTitleLabelFrame = CGRect(origin: rightTitleLabelOrigin, size: rightTitleLabelSize)
        (rightTitleLabel.frame, selectedRightTitleLabel.frame) = (rightTitleLabelFrame, rightTitleLabelFrame)
=======
        zip(titleLabels, selectedTitleLabels).forEach { label, selectedLabel in
            let index = titleLabels.indexOf(label)!
            
            var size = label.sizeThatFits(CGSize(width: titleLabelMaxWidth, height: titleLabelMaxHeight))
            size.width = min(size.width, titleLabelMaxWidth)
            
            let origin = CGPoint(
                x: floor((bounds.width / CGFloat(titleLabels.count)) * CGFloat(index) + (bounds.width / CGFloat(titleLabels.count) - size.width) / 2.0),
                y: floor((bounds.height - size.height) / 2.0)
            )
            
            let frame = CGRect(origin: origin, size: size)
            label.frame = frame
            selectedLabel.frame = frame
        }
>>>>>>> gontovnik/master
    }
    
}

// MARK: -
// MARK: UIGestureRecognizer Delegate

extension DGRunkeeperSwitch: UIGestureRecognizerDelegate {
    
    override public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == panGesture {
            return selectedBackgroundView.frame.contains(gestureRecognizer.location(in: self))
        }
        return super.gestureRecognizerShouldBegin(gestureRecognizer)
    }
    
}
