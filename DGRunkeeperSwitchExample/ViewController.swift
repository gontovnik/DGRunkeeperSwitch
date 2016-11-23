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
        
        UIApplication.shared.statusBarStyle = .lightContent
       
        navigationController!.navigationBar.isTranslucent = false
        navigationController!.navigationBar.barTintColor = UIColor(red: 252.0/255.0, green: 182.0/255.0, blue: 54.0/255.0, alpha: 1.0)
        
        let runkeeperSwitch = DGRunkeeperSwitch(titles: ["Feed", "Leaderboard"])
        runkeeperSwitch.backgroundColor = UIColor(red: 229.0/255.0, green: 163.0/255.0, blue: 48.0/255.0, alpha: 1.0)
        runkeeperSwitch.selectedBackgroundColor = .white
        runkeeperSwitch.titleColor = .white
        runkeeperSwitch.selectedTitleColor = UIColor(red: 255.0/255.0, green: 196.0/255.0, blue: 92.0/255.0, alpha: 1.0)
        runkeeperSwitch.titleFont = UIFont(name: "HelveticaNeue-Medium", size: 13.0)
        runkeeperSwitch.frame = CGRect(x: 30.0, y: 40.0, width: 200.0, height: 30.0)
        runkeeperSwitch.addTarget(self, action: #selector(ViewController.switchValueDidChange(sender:)), for: .valueChanged)
        navigationItem.titleView = runkeeperSwitch
        
        let runkeeperSwitch2 = DGRunkeeperSwitch()
        runkeeperSwitch2.titles = ["Daily", "Weekly", "Monthly", "Yearly"]
        runkeeperSwitch2.backgroundColor = UIColor(red: 239.0/255.0, green: 95.0/255.0, blue: 49.0/255.0, alpha: 1.0)
        runkeeperSwitch2.selectedBackgroundColor = .white
        runkeeperSwitch2.titleColor = .white
        runkeeperSwitch2.selectedTitleColor = UIColor(red: 239.0/255.0, green: 95.0/255.0, blue: 49.0/255.0, alpha: 1.0)
        runkeeperSwitch2.titleFont = UIFont(name: "HelveticaNeue-Medium", size: 13.0)
        runkeeperSwitch2.frame = CGRect(x: 50.0, y: 20.0, width: view.bounds.width - 100.0, height: 30.0)
        runkeeperSwitch2.autoresizingMask = [.flexibleWidth]
        view.addSubview(runkeeperSwitch2)
        
        let runkeeperSwitch3 = DGRunkeeperSwitch()
        runkeeperSwitch3.titles = ["Long left title", "Super long right title"]
        runkeeperSwitch3.backgroundColor = UIColor(red: 239.0/255.0, green: 95.0/255.0, blue: 49.0/255.0, alpha: 1.0)
        runkeeperSwitch3.selectedBackgroundColor = .white
        runkeeperSwitch3.titleColor = .white
        runkeeperSwitch3.selectedTitleColor = UIColor(red: 239.0/255.0, green: 95.0/255.0, blue: 49.0/255.0, alpha: 1.0)
        runkeeperSwitch3.titleFont = UIFont(name: "HelveticaNeue-Medium", size: 13.0)
        runkeeperSwitch3.frame = CGRect(x: 50.0, y: 70.0, width: view.bounds.width - 100.0, height: 30.0)
        runkeeperSwitch3.autoresizingMask = [.flexibleWidth]
        view.addSubview(runkeeperSwitch3)
        
        if let runkeeperSwitch4 = runkeeperSwitch4 {
            runkeeperSwitch4.titles = ["Apple", "Google"]
            runkeeperSwitch4.backgroundColor = UIColor(red: 122/255.0, green: 203/255.0, blue: 108/255.0, alpha: 1.0)
            runkeeperSwitch4.selectedBackgroundColor = .white
            runkeeperSwitch4.titleColor = .white
            runkeeperSwitch4.selectedTitleColor = UIColor(red: 135/255.0, green: 227/255.0, blue: 120/255.0, alpha: 1.0)
            runkeeperSwitch4.titleFont = UIFont(name: "HelveticaNeue-Light", size: 17.0)
        }
    }
    
    // MARK: -
    
    @IBAction func switchValueDidChange(sender: DGRunkeeperSwitch!) {
        print("valueChanged: \(sender.selectedIndex)")
    }
    
}

