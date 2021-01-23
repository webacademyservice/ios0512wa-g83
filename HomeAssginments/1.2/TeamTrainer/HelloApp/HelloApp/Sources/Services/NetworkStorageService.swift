//
//  NetoworkStorageService.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 23/01/2021.
//

import Foundation

class NetworkStorageService: StorageServiceProtocol {

    let networkController: NetworkControllerProtocol

    init(networkController: NetworkControllerProtocol) {
        self.networkController = networkController
    }


    func loadPets(callback: @escaping ((Result<[Pet], Error>) -> ())) {
        networkController.fetch(type: [DecodingPet].self, path: "v1/breeds", parameters: nil) { [weak self] (result) in

            guard let self = self else { return }

            do {
                let results = try result.get()
                let pets = results.map{ return Pet(name: $0.name, shortDescription: $0.description, image: nil, tags: [$0.temperament])
                }
                self.allPets = pets
                DispatchQueue.main.async {
                    callback(.success(pets))
                }
            } catch {
                DispatchQueue.main.async {
                    callback(.failure(error))
                }
            }
        }

    }


    var allPets: [Pet] = []


}
