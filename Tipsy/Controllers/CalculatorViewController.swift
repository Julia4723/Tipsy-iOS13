//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    
    var currentTip = ""
    var summ = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
       
        
        switch sender {
        case twentyPctButton:
            twentyPctButton.isSelected = true
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            currentTip = twentyPctButton.title(for: .selected) ?? ""
            
        case tenPctButton:
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            currentTip = tenPctButton.title(for: .selected) ?? ""
        default:
            zeroPctButton.isSelected = true
            twentyPctButton.isSelected = false
            tenPctButton.isSelected = false
            currentTip = zeroPctButton.title(for: .selected) ?? ""
        }
        
        print(currentTip)
        
       
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let afterPercent = ((Double(billTextField.text ?? "") ?? 0.0) * (Double(currentTip.dropLast()) ?? 0)) / 100
        summ = (afterPercent + (Double(billTextField.text ?? "") ?? 0.0)) / (Double(splitNumberLabel.text ?? "") ?? 0.0)
        print(summ)
        
        self.performSegue(withIdentifier: "tipSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tipSegue" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalLabelText = String(summ)
            destinationVC.settingsLabelText = "Tip: \(currentTip), Split: \(splitNumberLabel.text ?? "")"
        }
    }
}

