//
//  MainsScreenViewController.swift
//  daad
//
//  Created by Alex Mkoff on 1/14/21.
//

import UIKit


class customCells: UIView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = 45
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
//        self.layer.shadowColor = UIColor.white.cgColor
//        self.layer.shadowOpacity = 1
//        self.layer.shadowOffset = .zero
//        self.layer.shadowRadius = 3
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
}





class MainScreenViewController: UIViewController {
    @IBOutlet weak var firstCell: UIView!
    @IBOutlet weak var secondCell: UIView!
    @IBOutlet weak var thirdCell: UIView!
    @IBOutlet weak var firstWatch: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        
        
        firstWatch.alpha = 0
        UIButton.animate(withDuration: 2) { [self] in
            firstWatch.alpha = 1
    }
    }
}



