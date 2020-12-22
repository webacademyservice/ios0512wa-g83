//
//  PetDetailsViewController.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 13/12/2020.
//

import UIKit

class PetDetailsViewController: UIViewController {

    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var button: UIButton!

    var petService: StorageServiceProtocol!

    // MARK: Overrides
    override func viewDidLoad() {
        petService = StorageService()
        petService.loadPets()

        super.viewDidLoad()
        refresh()
    }

    // MARK: Action

    @IBAction func buttonTapped(_ sender: UIButton) {

        refresh()
    }

    // MARK: Custom private functions

    fileprivate func refresh() {
        let pet = petService.getPet()
        topTitleLabel.text = pet.name
        imageView.image = pet.image ?? #imageLiteral(resourceName: "default")
        subTitleLabel.text = pet.shortDescription
    }
}
