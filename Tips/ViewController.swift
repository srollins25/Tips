//
//  ViewController.swift
//  Tips
//
//  Created by stephan rollins on 6/20/18.
//  Copyright © 2018 stephan rollins. All rights reserved.
//  test
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{

    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var billTextBox: UITextField!
    @IBOutlet weak var totalTextBox: UITextField!
    @IBOutlet weak var tipTextBox: UITextField!
    @IBOutlet weak var splitTetxBox: UITextField!
    var percent = 0.20
    var split = 1
    
    @IBAction func percentSlider(_ sender: UISlider)
    {
        if(sender.tag == 1)
        {
            percentLabel.text = String(Int(sender.value)) + "%"
            percent = Double(Int(sender.value)) / 100
        }
    }
    
    @IBAction func splitSlider(_ sender: UISlider)
    {
        if(sender.tag == 2)
        {
            splitLabel.text = String(Int(sender.value))
            split = Int(sender.value)
        }
    }
    
    
    @IBAction func calculateButton(_ sender: UIButton)
    {
        if let bill = Double(billTextBox.text!)
        {
            
            //let total = bill + (bill * percent);
            let total = NSNumber(value: Double(bill + (bill * percent)))
            print("")
            print("Bill: " + String(bill))
            print("Percent: " + String(percent))
            print("Percent of bill: " + String(bill * percent))
            print("Total: " + String(bill + (bill * percent)))
            //print("Total: " + NSString(total))
            totalTextBox.text = "$" + String(format: "%.2f", total.doubleValue)
            let splitTotal = total.doubleValue / Double(split)
            tipTextBox.text = "$" + String(format: "%.2f", bill * percent)
            splitTetxBox.text = "$" + String(format: "%.2f", splitTotal)
        }
        
        else
        {
            displayAlertMessage(alertMessage: "Enter a valid Bill value. \nFormat: $X.XX")
        }
    }
    
    func displayAlertMessage(alertMessage: String)
    {
        let alert = UIAlertController(title:"Invalid input", message: alertMessage, preferredStyle: UIAlertControllerStyle.alert);
        
        let okAction = UIAlertAction(title:"Ok", style: UIAlertActionStyle.default, handler:nil);
        
        alert.addAction(okAction);
        
        self.present(alert, animated: true, completion:nil);
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        self.billTextBox.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //textField.keyboardType = UIKeyboard.NumberPad
        self.billTextBox.delegate = self
        percentLabel.text = "20%"
        splitLabel.text = "1"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

