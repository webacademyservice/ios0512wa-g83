//
//  PetSelectionViewController.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 27/12/2020.
//

import UIKit

class PetSelectionViewController: UIViewController {

    typealias DataSource = UITableViewDiffableDataSource<Int, Pet>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Int, Pet>

    @IBOutlet weak var tableView: UITableView!

    var petService: StorageServiceProtocol!

    private lazy var dataSource: DataSource = {
        return DataSource(tableView: tableView) { (tableView, indexPath, pet) -> UITableViewCell? in

            let cell = tableView.dequeueReusableCell(withIdentifier: "PetCell", for: indexPath)

            cell.textLabel?.text = pet.name
            cell.imageView?.image = pet.image

            return cell
        }
    }()

    private var pets: [Pet] {
        set {
            var snapshot = Snapshot()
            snapshot.appendSections([0])
            snapshot.appendItems(newValue, toSection: 0)
            dataSource.apply(snapshot, animatingDifferences: true, completion: nil)
        }
        get {
            dataSource.snapshot().itemIdentifiers(inSection: 0)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        petService = StorageService()
        petService.loadPets()
        pets = petService.allPets
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

//extension PetSelectionViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return pets.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PetCell", for: indexPath)
//
//        let pet = pets[indexPath.row]
//
//        cell.textLabel?.text = pet.name
//        cell.imageView?.image = pet.image
//
//        return cell
//    }
//}
