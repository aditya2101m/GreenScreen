//
//  SettingsViewController.swift
//  GreenScreen
//
//  Created by Kevin Lin on 4/4/21.
//

import UIKit
import Parse
import AlamofireImage

class SettingsViewController: UIViewController {

    @IBOutlet weak var userProfilePic: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var changeProfileButton: UIButton!
    @IBOutlet weak var addFriendsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
@IBAction func onLogoutButton(_ sender: Any) {
    PFUser.logOut()
        
    let main = UIStoryboard(name: "Main", bundle: nil)
    let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        
    let sceneDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        
    sceneDelegate.window?.rootViewController = loginViewController
    }
}

