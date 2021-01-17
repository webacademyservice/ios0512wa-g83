//
//  MockStorage.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 10/01/2021.
//

import Foundation

// Простой сервис-затычка
class MockStorage: StorageServiceProtocol {

    func loadPets(callback: @escaping ((Result<[Pet], Error>) -> ())) {

    }

    func getPet() -> Pet {
        Pet(name: "Random pet", shortDescription: "", image: nil, tags: [])
    }

    func search(for query: String) -> [Pet] {
        [Pet(name: "Search", shortDescription: "", image: nil, tags: [])]
    }

    var allPets: [Pet] {
        [Pet(name: "All pets", shortDescription: "", image: nil, tags: [])]
    }

}
