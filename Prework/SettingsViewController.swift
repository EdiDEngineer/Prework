//
//  SettingsViewController.swift
//  Prework
//
//  Created by Edidiong Ekong on 06/06/2021.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var setDefaultTip: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        setDefaultTip.keyboardType = .numberPad
        let defaults = UserDefaults.standard
        darkModeSwitch.isOn = defaults.bool( forKey: "darkMode")
        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveSettings(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(darkModeSwitch.isOn, forKey: "darkMode")
        defaults.set(setDefaultTip.text, forKey: "defaultTip")
        defaults.synchronize()
        self.navigationController?.popViewController(animated: true)
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
