//
//  ViewController.swift
//  Prework
//
//  Created by Edidiong Ekong on 10/05/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipRate: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        billAmountTextField.keyboardType = .numberPad

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let defaults = UserDefaults.standard
        if defaults.bool( forKey: "darkMode") {
            self.view.window?.overrideUserInterfaceStyle = .dark
        }else{
            self.view.window?.overrideUserInterfaceStyle = .light
        }
    
        let rate = Float( defaults.string( forKey: "defaultTip") ?? "0")
        self.tipSlider.setValue((rate ?? 0.0)/100.0, animated: true)
        tipRate.text = String(format: "%.2f%%",rate ?? 0.0)

    }

    @IBAction func calculateTip(_ sender: Any) {
        
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get total tip by multiplying tip * tiPercentage
        let tipPercentages = [0.15,0.18,0.2]
        let rate = tipPercentages[tipControl.selectedSegmentIndex]
        let tip = bill * rate
        let total = bill + tip
        tipSlider.setValue(Float(rate), animated: true)

        //Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f",tip)
        //Update Total Amount
        totalLabel.text = String(format: "$%.2f",total)

        tipRate.text = String(format: "%.2f%%",rate*100)
    }
    
    
    @IBAction func calculateTipSlider(_ sender: Any) {
        
        let bill = Double(billAmountTextField.text!) ?? 0
        let rate = tipSlider.value
        let tip = bill * Double(rate)
        let total = bill + tip
        
        //Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f",tip)
        //Update Total Amount
        totalLabel.text = String(format: "$%.2f",total)

        tipRate.text = String(format: "%.2f%%",rate*100)
        
    }
    
}

