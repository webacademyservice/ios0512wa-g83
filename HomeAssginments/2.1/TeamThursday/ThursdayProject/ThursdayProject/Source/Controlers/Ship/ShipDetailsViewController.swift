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
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var currentShip: Ship?
    
    var shipService: StorageServiceProtocol!
    
    //MARK: Overrides
    
    override func viewDidLoad() {
        shipService = StorageService()
        shipService.loadShips()
        collectionView.allowsMultipleSelection = false
        
        super.viewDidLoad()
        if let currentShip = currentShip {
            updateUI(for: currentShip)
        } else {
        refresh()
        }

 
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
    
    fileprivate func updateUI(for ship: Ship) {
        
        topTitleLabel.text = ship.name
        imageView.image = ship.image ?? Image(contentsOfFile: "Image")
        subTitleLabel.text = ship.shortDescription
        
        collectionView.reloadData()
    }
    fileprivate func refresh() {
        let ship = shipService.getShip()
        currentShip = ship
        
        updateUI(for: ship)
    }
}
    // MARK: CollectionView DataSource

extension ShipDetailsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        guard let ship = currentShip else { return 0}
        return ship.tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShipCell", for: indexPath)
        
        guard let tag = currentShip?.tags[indexPath.item] else { return cell}
        
        let shipTagCell = cell as? ShipTagCollectionViewCell
        
        shipTagCell?.tagLabel.text = tag
        
        return cell
        
        }
    }

extension ShipDetailsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let tag = currentShip?.tags[indexPath.item] else {return}
        print("tag selected \(tag)" )
        
        view.backgroundColor = (indexPath.item % 2==0) ? .systemRed : . systemGreen
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView.indexPathsForSelectedItems?.count == 0 {
            view.backgroundColor = .white
        }
    }
}
