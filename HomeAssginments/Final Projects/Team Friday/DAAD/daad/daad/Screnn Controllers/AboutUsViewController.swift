//
//  AboutUsViewController.swift
//  daad
//
//  Created by Alex Mkoff on 1/3/21.
//

import UIKit

class AboutUsViewController: UIViewController {
    @IBOutlet weak var cellGreen: UIView!
    @IBOutlet weak var cellBlue: UIView!
    @IBOutlet weak var cellOrange: UIView!
    @IBOutlet weak var cellRed: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "About Us"
        cellGreen.layer.cornerRadius = 25
        cellGreen.layer.masksToBounds = true
        cellBlue.layer.cornerRadius = 25
        cellBlue.layer.masksToBounds = true
        cellOrange.layer.cornerRadius = 25
        cellOrange.layer.masksToBounds = true
        cellRed.layer.cornerRadius = 25
        cellRed.layer.masksToBounds = true


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
