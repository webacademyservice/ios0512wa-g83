//
//  StorageService.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 13/12/2020.
//

import Foundation

protocol StorageServiceProtocol {
    func getPet() -> Pet

    func loadPets()

    func search(for query: String) -> [Pet]

    var allPets: [Pet] { get }
}

class StorageService: StorageServiceProtocol {

    private var pets: [Pet] = []

    func getPet() -> Pet {
        return pets.randomElement()!
    }

    var allPets: [Pet] {
        get { return pets }
    }

    func search(for query: String) -> [Pet] {
        pets.filter { return $0.name.lowercased().contains(query.lowercased()) }
    }

    func loadPets() {
        pets = [
            Pet(
                name: "American Curl",
                shortDescription: "The distinctive feature of the American Curl is their attractive, uniquely curled-back ears. Elegant, well balanced, moderately muscled, slender rather than massive in build.  They often appear well proportioned and balanced and can vary in size.",
                image: #imageLiteral(resourceName: "american-curl"),
                tags: ["whimsical", "curled ears"]
            ),
            Pet(
                name: "American Shorthair",
                shortDescription: "The American Shorthair is a true breed of working cat. The general effect is that of a strongly built, well balanced, symmetrical cat with conformation indicating power, endurance, and agility.",
                image: #imageLiteral(resourceName: "american-shorthair"),
                tags: ["quite", "stealthy"]
            ),
            Pet(
                name: "British Shorthair",
                shortDescription: "The British Shorthair is a compact, well-balanced, and powerful cat, with a short, very dense coat. They often convey an overall impression of balance and proportion in which no feature is exaggerated.",
                image: #imageLiteral(resourceName: "british-shorthair"),
                tags: ["sweet", "round", "massive head"]
            ),
            Pet(
                name: "Devon Rex",
                shortDescription: "The Devon Rex is a breed of unique appearance. The breed’s large eyes, short muzzle, prominent cheekbones, and huge, lowset ears create a characteristic elfin look. A cat of medium fine frame, the Devon is well covered with soft, wavy fur. The fur is of a distinctive texture, as the mutation that causes its wavy coat is cultivated in no other breed.",
                image: #imageLiteral(resourceName: "devon-rex"),
                tags: ["huge ears", "missing whiskers"]
            ),
        ]
    }
}
