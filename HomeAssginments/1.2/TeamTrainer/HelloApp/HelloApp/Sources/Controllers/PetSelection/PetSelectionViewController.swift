//
//  PetSelectionViewController.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 27/12/2020.
//

import UIKit

class PetSelectionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var petService: StorageServiceProtocol!

    private var pets: [Pet] {
        self.petService.allPets
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        petService = StorageService()
        petService.loadPets()
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        guard
            let destination = segue.destination as? PetDetailsViewController
        else { return }

        guard
            let selection = tableView.indexPathForSelectedRow else { return }

        let pet = pets[selection.row]

        destination.currentPet = pet
    }

}

extension PetSelectionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return pets.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "PetCell", for: indexPath)

        let pet = pets[indexPath.row]

        cell.textLabel?.text = pet.name
        cell.imageView?.image = pet.image

        return cell
    }
}
