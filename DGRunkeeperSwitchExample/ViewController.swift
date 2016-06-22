//
//  ViewController.swift
//  DGRunkeeperSwitchExample
//
//  Created by Danil Gontovnik on 9/3/15.
//  Copyright © 2015 Danil Gontovnik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: -
    // MARK: Vars
    
    @IBOutlet weak var runkeeperSwitch4: DGRunkeeperSwitch?

    // MARK: -
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = .LightContent
       
        navigationController!.navigationBar.translucent = false
        navigationController!.navigationBar.barTintColor = UIColor(red: 252.0/255.0, green: 182.0/255.0, blue: 54.0/255.0, alpha: 1.0)
        
        let runkeeperSwitch = DGRunkeeperSwitch(leftTitle: "Feed", rightTitle: "Leaderboard")
        runkeeperSwitch.backgroundColor = UIColor(red: 229.0/255.0, green: 163.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        runkeeperSwitch.selectedBackgroundColor = .whiteColor()
        runkeeperSwitch.titleColor = .whiteColor()
        runkeeperSwitch.selectedTitleColor = UIColor(red: 255.0/255.0, green: 196.0/255.0, blue: 92.0/255.0, alpha: 1.0)
        runkeeperSwitch.titleFont = UIFont(name: "HelveticaNeue-Medium", size: 13.0)
        runkeeperSwitch.frame = CGRect(x: 30.0, y: 40.0, width: 200.0, height: 30.0)
        runkeeperSwitch.addTarget(self, action: Selector("switchValueDidChange:"), forControlEvents: .ValueChanged)
        navigationItem.titleView = runkeeperSwitch
        
        let runkeeperSwitch2 = DGRunkeeperSwitch()
        runkeeperSwitch2.leftTitle = "Weekly"
        runkeeperSwitch2.rightTitle = "Monthly"
        runkeeperSwitch2.backgroundColor = UIColor(red: 239.0/255.0, green: 95.0/255.0, blue: 49.0/255.0, alpha: 1.0)
        runkeeperSwitch2.selectedBackgroundColor = .whiteColor()
        runkeeperSwitch2.titleColor = .whiteColor()
        runkeeperSwitch2.selectedTitleColor = UIColor(red: 239.0/255.0, green: 95.0/255.0, blue: 49.0/255.0, alpha: 1.0)
        runkeeperSwitch2.titleFont = UIFont(name: "HelveticaNeue-Medium", size: 13.0)
        runkeeperSwitch2.frame = CGRect(x: 50.0, y: 20.0, width: view.bounds.width - 100.0, height: 30.0)
        runkeeperSwitch2.autoresizingMask = [.FlexibleWidth]
        view.addSubview(runkeeperSwitch2)
        
        let runkeeperSwitch3 = DGRunkeeperSwitch()
        runkeeperSwitch3.leftTitle = "Super long left title"
        runkeeperSwitch3.rightTitle = "Super long right title"
        runkeeperSwitch3.backgroundColor = UIColor(red: 239.0/255.0, green: 95.0/255.0, blue: 49.0/255.0, alpha: 1.0)
        runkeeperSwitch3.selectedBackgroundColor = .whiteColor()
        runkeeperSwitch3.titleColor = .whiteColor()
        runkeeperSwitch3.selectedTitleColor = UIColor(red: 239.0/255.0, green: 95.0/255.0, blue: 49.0/255.0, alpha: 1.0)
        runkeeperSwitch3.titleFont = UIFont(name: "HelveticaNeue-Medium", size: 13.0)
        runkeeperSwitch3.frame = CGRect(x: 50.0, y: 70.0, width: view.bounds.width - 100.0, height: 30.0)
        runkeeperSwitch3.autoresizingMask = [.FlexibleWidth]
        view.addSubview(runkeeperSwitch3)
        
        if let runkeeperSwitch4 = runkeeperSwitch4 {
            runkeeperSwitch4.leftTitle = "Apple"
            runkeeperSwitch4.rightTitle = "Google"
            runkeeperSwitch4.backgroundColor = UIColor(red: 122/255.0, green: 203/255.0, blue: 108/255.0, alpha: 1.0)
            runkeeperSwitch4.selectedBackgroundColor = .whiteColor()
            runkeeperSwitch4.titleColor = .whiteColor()
            runkeeperSwitch4.selectedTitleColor = UIColor(red: 135/255.0, green: 227/255.0, blue: 120/255.0, alpha: 1.0)
            runkeeperSwitch4.titleFont = UIFont(name: "HelveticaNeue-Light", size: 17.0)
            runkeeperSwitch4.toggleMode = true
        }
    }
    
    // MARK: -
    
    @IBAction func switchValueDidChange(sender: DGRunkeeperSwitch!) {
        print("valueChanged: \(sender.selectedIndex)")
    }
    
}

