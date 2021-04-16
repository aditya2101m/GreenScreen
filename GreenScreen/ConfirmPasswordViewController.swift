//
//  ConfirmPasswordViewController.swift
//  GreenScreen
//
//  Created by Kevin Lin on 4/16/21.
//

import UIKit
import Parse

class ConfirmPasswordViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: PFUser.current()?["username"] as! String, password: passwordTextField.text!) { (user: PFUser?, error: Error?) -> Void in
            if user != nil{
                let pw = UIStoryboard(name: "Main", bundle: nil)
                let ChangePasswordViewController = pw.instantiateViewController(withIdentifier: "ChangePasswordViewController")
                ChangePasswordViewController.modalPresentationStyle = .fullScreen
                ChangePasswordViewController.modalTransitionStyle = .coverVertical
                self.present(ChangePasswordViewController, animated: true, completion: nil)

            }else{
                self.errorTextField.text = "Wrong password, please try again."
            }
        }
    }

    
}

