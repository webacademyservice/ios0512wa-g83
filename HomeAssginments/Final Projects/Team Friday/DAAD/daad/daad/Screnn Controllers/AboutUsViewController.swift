//
//  AboutUsViewController.swift
//  daad
//
//  Created by Alex Mkoff on 1/3/21.
//

import UIKit

class AboutUsViewController: UIViewController {
    @IBOutlet weak var cellGreen: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "About Us"
        cellGreen.layer.cornerRadius = 25
        cellGreen.layer.masksToBounds = true

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
