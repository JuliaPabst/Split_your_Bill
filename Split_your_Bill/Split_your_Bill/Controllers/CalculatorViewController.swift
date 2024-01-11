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
    
    var textfieldWithDot: String = ""
    var tip: Double = 0.0
    var amountOfPeople: Double = 1.0
    var splittedBill: Double = 0.0
    var bill: Double = 0.0
    var billWithTip: Double = 0.0
    var finalBillPerPerson: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepper.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        textfield.keyboardType = .decimalPad
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
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        textfieldWithDot = textfield.text!.replacingOccurrences(of: ",", with: ".")
        
        bill = Double(textfieldWithDot) ?? 0.0
        
        billWithTip = bill + bill * Double(tip)
        
        amountOfPeople = stepper.value
        
        splittedBill = billWithTip / amountOfPeople
        
        finalBillPerPerson =  String(format: "%.2f", splittedBill)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = splittedBill
            destinationVC.numberOfPeople = amountOfPeople
            destinationVC.tip = Int(tip)
        }
    }
    
}

