//
//  ResultsViewController.swift
//  Split_your_Bill
//
//  Created by Julia Pabst on 09.01.24.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var totalLabel: UILabel!
    
    @IBOutlet var settingsLabel: UILabel!
    
    var result = 0.0
    var numberOfPeople: Double = 1.0
    var tip: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = "\(result)€"
        
        settingsLabel.text = "Split between \(numberOfPeople), with \(tip)% tip"

       
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
