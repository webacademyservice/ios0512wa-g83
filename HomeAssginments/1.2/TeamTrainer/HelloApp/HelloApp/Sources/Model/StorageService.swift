//
//  StorageService.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 13/12/2020.
//

import Foundation

protocol StorageServiceProtocol {
    func getPet() -> Pet
}

class StorageService: StorageServiceProtocol {

    private var pets: [Pet] = []

    init() {
        self.loadPets()
//        self.pets = pets
    }

    func getPet() -> Pet {
        return pets.randomElement()!
    }


    private func loadPets() {
        pets = [
            Pet(name: "Roger the Rabbit"),
            Pet(name: "Bucks Bunny")
        ]
    }
}
