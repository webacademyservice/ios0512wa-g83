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
        firstCell.layer.cornerRadius = 18
        firstCell.layer.masksToBounds = true
        secondCell.layer.cornerRadius = 18
        secondCell.layer.masksToBounds = true
        thirdCell.layer.cornerRadius = 18
        thirdCell.layer.masksToBounds = true
        

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
