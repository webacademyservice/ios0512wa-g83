//
//  DetailViewController.swift
//  daad
//
//  Created by Alex Mkoff on 1/13/21.
//

import UIKit

class DetailViewController: UIViewController {
    var watch: Watch!
    
    @IBOutlet weak var watchImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = watch.name
        watchImage.image = UIImage(named: watch.name)

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
