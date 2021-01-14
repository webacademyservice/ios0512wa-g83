//
//  RegisterViewController.swift
//  daad
//
//  Created by Alex Mkoff on 1/5/21.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Welcome"
        enterButton.layer.cornerRadius = 25
        enterButton.layer.masksToBounds = true
        enterButton.layer.borderWidth = 1
        enterButton.layer.borderColor = UIColor.white.cgColor
        

        // Do any additional setup after loading the view.
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
