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

    // Инкапсулированый сервис (задача 6)
    var petService: StorageServiceProtocol!

// Не инкапсулированый массив прямо в контроллере. (без задачи 6)
//    let pets =  [
//        Pet(name: "Roger the Rabbit"),
//        Pet(name: "Bucks Bunny")
//    ]

    // MARK: Overrides
    override func viewDidLoad() {

        petService = StorageService()

        super.viewDidLoad()

        topTitleLabel.text = "Hello world!"

        subTitleLabel.text = "Welcome to first IOS examnple"

        imageView.image = UIImage(named: "icon")
    }

    // MARK: Action

    @IBAction func buttonTapped(_ sender: UIButton) {

        // С задачей 6
        let pet = petService.getPet()

        // Без задачи 6
        // let pet = pets.randomElement()!

        topTitleLabel.text = pet.name
        subTitleLabel.text = pet.description()
    }

    @IBAction func buttonTouchedUpUotside(_ sender: Any) {

        topTitleLabel.text = "Touched up outside"
    }

    // MARK: Custom private functions

}
