//
//  ViewController.swift
//  tips3
//
//  Created by Jose Hernandez on 4/13/15.
//  Copyright (c) 2015 Jose Hernandez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultIndex = defaults.integerForKey("default_tip_percentage_index")
        tipControl.selectedSegmentIndex = defaultIndex
    }
    
    @IBAction func onAmountChanged(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22];
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        //println(billField.text)
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(tipControl.selectedSegmentIndex, forKey: "default_tip_percentage_index")
        defaults.synchronize()
    }

    @IBAction func onTap(sender: AnyObject) {
        println("tap")
        view.endEditing(true)
    }
    
    
    
}

