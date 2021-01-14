//
//  MainsScreenViewController.swift
//  daad
//
//  Created by Alex Mkoff on 1/14/21.
//

import UIKit

class MainScreenViewController: UIViewController {
    @IBOutlet weak var firstCell: UIView!
    @IBOutlet weak var secondCell: UIView!
    @IBOutlet weak var thirdCell: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        firstCell.layer.cornerRadius = 25
        firstCell.layer.masksToBounds = true
        firstCell.layer.borderWidth = 2
        firstCell.layer.borderColor = UIColor.white.cgColor
        firstCell.layer.shadowColor = UIColor.white.cgColor
        firstCell.layer.shadowOpacity = 1
        firstCell.layer.shadowOffset = .zero
        firstCell.layer.shadowRadius = 3
        
        
        secondCell.layer.cornerRadius = 25
        secondCell.layer.masksToBounds = true
        secondCell.layer.borderWidth = 2
        secondCell.layer.borderColor = UIColor.white.cgColor
        secondCell.layer.shadowColor = UIColor.white.cgColor
        secondCell.layer.shadowOpacity = 1
        secondCell.layer.shadowOffset = .zero
        secondCell.layer.shadowRadius = 3
        
        
        thirdCell.layer.cornerRadius = 25
        thirdCell.layer.masksToBounds = true
        thirdCell.layer.borderWidth = 2
        thirdCell.layer.borderColor = UIColor.white.cgColor
        thirdCell.layer.shadowColor = UIColor.white.cgColor
        thirdCell.layer.shadowOpacity = 1
        thirdCell.layer.shadowOffset = .zero
        thirdCell.layer.shadowRadius = 3
        
        

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
