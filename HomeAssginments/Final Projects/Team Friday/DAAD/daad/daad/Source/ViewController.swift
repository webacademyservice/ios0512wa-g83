//
//  ViewController.swift
//  daad
//
//  Created by Alex Mkoff on 12/28/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 18
        logInButton.layer.masksToBounds = true
        logInButton.layer.borderWidth = 1
        logInButton.layer.borderColor = UIColor.white.cgColor
        signInButton.layer.cornerRadius = 18
        signInButton.layer.masksToBounds = true
        signInButton.layer.borderWidth = 1
        signInButton.layer.borderColor = UIColor.white.cgColor
        
    }

}

