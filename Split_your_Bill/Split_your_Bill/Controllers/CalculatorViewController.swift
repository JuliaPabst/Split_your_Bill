//
//  ViewController.swift
//  Split_your_Bill
//
//  Created by Julia Pabst on 09.01.24.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroButton: UIButton!
    @IBOutlet var tenButton: UIButton!
    @IBOutlet var twentyButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!

    @IBAction func tipChanged(_ sender: UIButton) {
        sender.isSelected = true
        print(sender.tag)
        
        if(sender.tag == 0){
            print(0.0)
            tenButton.isSelected = false
            twentyButton.isSelected = false
        } else if (sender.tag == 1){
            print(0.1)
            zeroButton.isSelected = false
            twentyButton.isSelected = false
        } else {
            print(0.2)
            zeroButton.isSelected = false
            tenButton.isSelected = false
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
    }
    
}

