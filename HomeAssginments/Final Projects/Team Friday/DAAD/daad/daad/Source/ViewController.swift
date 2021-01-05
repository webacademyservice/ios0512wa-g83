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


    override func viewDidLoad() {
        super.viewDidLoad()
        logInButton.layer.cornerRadius = 15
        logInButton.layer.masksToBounds = true

        
    }

}

