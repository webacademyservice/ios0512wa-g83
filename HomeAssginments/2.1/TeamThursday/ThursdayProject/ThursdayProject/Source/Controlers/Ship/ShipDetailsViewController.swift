//
//  ShipDetailsViewController.swift
//  ThursdayProject
//
//  Created by admin on 12/23/20.
//

import UIKit

class ShipDetailsViewController:
    UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var topTitleLabel: UILabel!
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var button: UIButton!
    
    var shipService: StorageServiceProtocol!
    
    //MARK: Overrides
    
    override func viewDidLoad() {
        shipService = StorageService()
        shipService.loadShips()
        
        super.viewDidLoad()
        refresh()
        

 
    }
    
    // MARK: Actions
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        guard let container = self.imageView.superview else {return}
        
        var perspectiveTransform = CATransform3DIdentity
        perspectiveTransform.m34 = 1.0 / 500.0;
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            options: [.curveEaseIn]
        ){
            container.layer.transform = CATransform3DRotate(perspectiveTransform, .pi / 2, 0, 1, 0)
            
        } completion: { (_) in
            
            self.refresh()
            
            container.layer.transform = CATransform3DRotate(perspectiveTransform, .pi / 2, 0, -1, 0)
            UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut]){
                
                container.layer.transform = CATransform3DIdentity
            }
        }
    
    }
    
    
    // MARK: Custom private functions
    
    fileprivate func refresh() {
        let ship = shipService.getShip()
        topTitleLabel.text = ship.name
        imageView.image = ship.image ?? Image(contentsOfFile: "Image")
        subTitleLabel.text = ship.shortDescription
    }
    
  
    }
    


