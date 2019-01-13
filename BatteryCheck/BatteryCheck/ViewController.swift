//
//  ViewController.swift
//  BatteryCheck
//
//  Created by Hanbyeol Yoo on 2018. 3. 8..
//  Copyright © 2018년 Hanbyeol Yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblBattery: UILabel!
    
    var batteryLevel: Float {
        return UIDevice.current.batteryLevel
    }
    
    var timer = Timer()
    
    func scheduledTimerWithTimeInterval(){
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(self.batteryLevelCheck), userInfo: nil, repeats: true)
    }
    
    @objc func batteryLevelCheck() {
        self.lblBattery.text = "\(batteryLevel * 100)%"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIDevice.current.isBatteryMonitoringEnabled = true
        batteryLevelCheck()
        scheduledTimerWithTimeInterval()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
