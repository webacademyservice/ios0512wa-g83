//
//  BrowseViewController.swift
//  daad
//
//  Created by Alex Mkoff on 1/3/21.
//

import UIKit

class BrowseViewController: UIViewController {
    @IBOutlet weak var goldenCell: UIView!
    @IBOutlet weak var blackyCell: UIView!
    @IBOutlet weak var silverCell: UIView!
    @IBOutlet weak var silverBigCell: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Browse"
        goldenCell.layer.cornerRadius = 25
        goldenCell.layer.masksToBounds = true
        blackyCell.layer.cornerRadius = 25
        blackyCell.layer.masksToBounds = true
        silverCell.layer.cornerRadius = 25
        silverCell.layer.masksToBounds = true
        silverBigCell.layer.cornerRadius = 25
        silverBigCell.layer.masksToBounds = true

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
