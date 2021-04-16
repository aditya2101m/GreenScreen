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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let user = PFUser.current()
        let profilePicture = user!["profilePic"] as? PFFileObject
        profilePicture?.getDataInBackground(block: { (imageData, error) in
            DispatchQueue.main.async {
                if imageData != nil, error == nil{
                    let image = UIImage(data: imageData!)
                    self.userProfilePic.image = image
                }
            }
        })

        userName.text = user?["username"] as! String
    }

    
@IBAction func onLogoutButton(_ sender: Any) {
    PFUser.logOut()
        
    let main = UIStoryboard(name: "Main", bundle: nil)
    let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        
    let sceneDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        
    sceneDelegate.window?.rootViewController = loginViewController
    }
}

