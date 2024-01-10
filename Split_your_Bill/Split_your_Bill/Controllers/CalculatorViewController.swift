//
//  ViewController.swift
//  Split_your_Bill
//
//  Created by Julia Pabst on 09.01.24.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroButton: UIButton!
    @IBOutlet var tenButton: UIButton!
    @IBOutlet var twentyButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    
    @IBOutlet var stepper: UIStepper!
    
    @IBOutlet var textfield: UITextField!
    
    var tip = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        stepper.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        textfield.keyboardType = .numberPad
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
           view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false
        sender.isSelected = true
        
        if(sender.tag == 0){
            tip = 0.0
        } else if (sender.tag == 1){
            tip = 0.1
        } else {
            tip = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = Double(textfield.text ?? "0.0") ?? 0.0
        
        let billWithTip = bill + bill * Double(tip)
        
        let amountOfPeople = stepper.value
        
        let splittedBill = billWithTip / amountOfPeople
        
        print(splittedBill)
    }
    
}

