//
//  ShipTagCollectionViewCell.swift
//  ThursdayProject
//
//  Created by admin on 1/8/21.
//

import UIKit

class ShipTagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tagLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.backgroundColor = .systemBlue
            } else {
                self.backgroundColor = .orange
            }
        }
    }
}
