//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by PotPie on 3/7/17.
//  Copyright © 2017 PotPie - CareerFoundry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let poundRate = 0.69
    let yenRate = 113.94
    let euroRate = 0.89
    var dollarAmount = 0.0
    
    // adding clear button 
    
    @IBAction func clearAmount(_ sender: UIButton) {
        inputTextField.text = ""
        yenLabel.text = "0.00" /* initially the task only required the clear button clearing the inputTextField. I felt that it would be a better user experience to have all the currency conversions clear as well */
        euroLabel.text = "0.00"
        poundLabel.text = "0.00"
        return
    }
    
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var euroLabel: UILabel!
    @IBOutlet weak var yenLabel: UILabel!
    @IBOutlet weak var poundLabel: UILabel!
    @IBAction func convertCurrency(_ sender: UIButton) {
        if let amount = Double(inputTextField.text!) {
            dollarAmount = amount
        }
        yenLabel.text = "\(dollarAmount * yenRate)"
        euroLabel.text = "\(dollarAmount * euroRate)"
        poundLabel.text = "\(dollarAmount * poundRate)"
        dollarAmount = 0.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputTextField.delegate = self
    }
    
    // called when return key is pressed - disabled on computer
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //Called when user taps outside the text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

