//
//  FeedViewController.swift
//  GreenScreen
//
//  Created by Aditya Majumdar on 03/04/21.
//

import UIKit
import Gifu
import Parse


class FeedViewController: UIViewController {
    
    @IBOutlet weak var gifImageView: UIImageView!
    

    

    override func viewDidLoad() {
        let gifURL : String = "https://media.giphy.com/media/uCN46U7nqlwnibPN0I/giphy.gif"
        let imageURL = UIImage.gifImageWithURL(gifURL)
        let imageView3 = UIImageView(image: imageURL)
        imageView3.frame = CGRect(x: 12, y: 80, width: self.view.frame.size.width - 0, height: 380)
        view.addSubview(imageView3)
    }
    
    
}
