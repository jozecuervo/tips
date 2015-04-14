//
//  SettingsViewController.swift
//  tips3
//
//  Created by Jose Hernandez on 4/14/15.
//  Copyright (c) 2015 Jose Hernandez. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var DefaultTipController: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func defaultAmountChanged(sender: AnyObject) {
        var defaults = NSUserDefaults.standardUserDefaults()
        println(DefaultTipController.selectedSegmentIndex)
        defaults.setInteger(DefaultTipController.selectedSegmentIndex, forKey: "default_tip_percentage_index")
        defaults.synchronize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultIndex = defaults.integerForKey("default_tip_percentage_index")
        println(defaultIndex)
        DefaultTipController.selectedSegmentIndex = defaultIndex
    }
}
