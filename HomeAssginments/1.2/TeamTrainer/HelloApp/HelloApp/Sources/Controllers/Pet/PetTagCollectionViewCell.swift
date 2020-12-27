//
//  PetTagCollectionViewCell.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 26/12/2020.
//

import UIKit

class PetTagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tagLabel: UILabel!

    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.backgroundColor = .systemPink
            } else {
                self.backgroundColor = .orange
            }
        }
    }
}
