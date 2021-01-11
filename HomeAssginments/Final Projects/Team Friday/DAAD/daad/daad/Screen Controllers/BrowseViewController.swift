//
//  BrowseViewController.swift
//  daad
//
//  Created by Alex Mkoff on 1/3/21.
//

import UIKit

class BrowseViewController: UIViewController {
    @IBOutlet weak var yellowCell: UIView!
    @IBOutlet weak var blueCell: UIView!
    @IBOutlet weak var redCell: UIView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Browse"
        yellowCell.layer.cornerRadius = 18
        yellowCell.layer.masksToBounds = true
        yellowCell.layer.borderWidth = 1
        yellowCell.layer.borderColor = UIColor.white.cgColor
        blueCell.layer.cornerRadius = 18
        blueCell.layer.masksToBounds = true
        blueCell.layer.borderWidth = 1
        blueCell.layer.borderColor = UIColor.white.cgColor
        redCell.layer.cornerRadius = 18
        redCell.layer.masksToBounds = true
        redCell.layer.borderWidth = 1
        redCell.layer.borderColor = UIColor.white.cgColor
    }
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


