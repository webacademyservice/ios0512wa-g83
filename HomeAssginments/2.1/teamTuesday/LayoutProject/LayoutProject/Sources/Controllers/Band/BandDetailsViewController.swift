//
//  BandDetailsViewController.swift
//  LayoutProject
//
//  Created by Maryna Snigurska on 18/12/2020.
//

import UIKit

class BandDetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var topTitleLabel: UILabel!
    
    @IBOutlet weak var nameSubTitleLabel: UILabel!
    
    @IBOutlet weak var countrySubTitleLabel: UILabel!
    
    @IBOutlet weak var musicianSubTitleLabel: UILabel!
    
    @IBOutlet weak var albumsSubTitleLabel: UILabel!
    
    @IBOutlet weak var descriptionSubTitleLabel: UILabel!
    
    @IBOutlet weak var redButton: UIButton!
    
    @IBOutlet weak var greenButton: UIButton!
    
    //MARK:Ovverridies
    
    override func viewDidLoad(){ super.viewDidLoad()
        
        topTitleLabel.text = "Hello world"
        
        nameSubTitleLabel.text = "Hello"
        
        countrySubTitleLabel.text = "UA"
        
        musicianSubTitleLabel.text = "5 musicians"
        
        albumsSubTitleLabel.text = "6 albums"
        
        descriptionSubTitleLabel.text = "hjdbhsdfbhesbdhsbdshdbfsdnbfsdfbshdbfhsdbghjfsbdghjfsdbgjhdbshgbdgsdbghdbghsdbh"
        
        imageView.image = UIImage(named: "imgBeatles")
    }
    
    // MARK: Action
    
    @IBAction func redButtonTapped(_ sender: UIButton) {
        topTitleLabel.text = "Tapped"
        sender.setTitle("Taped!", for: .normal)
        
        
    }
    
    @IBAction func redButtonTouchedUpOutside(_ sender: Any) {
        topTitleLabel.text = "You tached up outside"
    }
    @IBAction func greenButtonTapped(_ sender: Any) {
    }
    @IBAction func greenButtonTouchedUpOutside(_ sender: Any) {
    }
    
    // MARK: Custom private functions



}
