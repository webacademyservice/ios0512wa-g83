//
//  FileService.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 17/01/2021.
//

import Foundation

class FileService: StorageServiceProtocol {

    enum Error: Swift.Error {
        case fileNotFound
    }


    let fileName: String

    lazy var decoder: JSONDecoder = JSONDecoder()

    var allPets: [Pet] = []

    init(name: String) {
        fileName = name
    }

    func getPet() -> Pet {
        allPets.randomElement() ?? Pet(name: "", shortDescription: "", image: nil, tags: [])
    }

    func loadPets(callback: @escaping ((Result<[Pet], Swift.Error>) -> ())) {

        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }

            do {
                let pets = try self.loadData()
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

    func search(for query: String) -> [Pet] {
        allPets.filter{ $0.name.lowercased().contains(query.lowercased()) }
    }


    // MARK: Private helpers

    private func mapPets(pets: [DecodingPet]) -> [Pet] {
        return pets.map{
            let tags = $0.temperament.components(separatedBy: .punctuationCharacters)

            let image: Image?
            if
                let url = $0.image?.url,
                let data = try? Data(contentsOf: url),
                let imageFromData = Image(data: data)
            {
                image = imageFromData
            } else {
                image = nil
            }

            return Pet(name: $0.name, shortDescription: $0.description, image: image, tags: tags)
        }
    }

    private func loadData() throws -> [Pet] {
        let bundle = Bundle.main
        guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
            throw Error.fileNotFound
        }

        let data = try Data(contentsOf: url)

        let decodedPets = try decoder.decode([DecodingPet].self, from: data)

        return mapPets(pets: decodedPets)
    }

    
}

