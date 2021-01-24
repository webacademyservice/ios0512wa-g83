//
//  AddNoteViewController.swift
//  FireNotes
//
//  Created by Mykhailo Vorontsov on 24/01/2021.
//

import UIKit

class AddNoteViewController: UIViewController {

    typealias Callback = (String, Bool) -> ()

    var callback: Callback?

    @IBOutlet weak var isPublicSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addNote(_ sender: UITextField) {

        guard  let text = sender.text, text.count > 0 else {
            return
        }

        callback?(text, isPublicSwitch.isOn)
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
