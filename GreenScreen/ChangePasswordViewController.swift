//
//  ChangePasswordViewController.swift
//  GreenScreen
//
//  Created by Kevin Lin on 4/16/21.
//

import UIKit
import Parse

class ChangePasswordViewController: UIViewController {
    @IBOutlet weak var passwordTextField1: UITextField!
    @IBOutlet weak var passwordTextField2: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    let user = PFUser.current()!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        if passwordTextField1.text == passwordTextField2.text{
            let password = passwordTextField1.text
            user["password"] = password
            user.saveInBackground()
            let setting = UIStoryboard(name: "Main", bundle: nil)
            let SettingsViewController = setting.instantiateViewController(withIdentifier: "SettingsViewController")
            self.dismiss(animated: true, completion: nil)

        }else{
            errorLabel.text = "Passwords are not matched, please try again"
        }
    }
    
}
