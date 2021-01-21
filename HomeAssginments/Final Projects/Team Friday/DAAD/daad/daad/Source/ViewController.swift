//
//  ViewController2.swift
//  daad
//
//  Created by Alex Mkoff on 1/14/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var mainLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logInButton.layer.cornerRadius = 25
        logInButton.layer.masksToBounds = true
        logInButton.layer.borderWidth = 1
        logInButton.layer.borderColor = UIColor.white.cgColor
      
        
        signInButton.layer.cornerRadius = 25
        signInButton.layer.masksToBounds = true
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = UIColor.white.cgColor
        
        self.mainLogo.alpha = 0
        UIImageView.animate(withDuration: 3) {
            self.mainLogo.alpha = 1
    }

}
}
