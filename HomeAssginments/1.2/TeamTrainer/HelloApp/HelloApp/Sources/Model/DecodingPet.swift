//
//  DecodingPet.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 17/01/2021.
//

import Foundation

struct DecodingPet: Codable {

    struct ImageDetails: Codable {
        let url: URL?
    }

    let name: String
    let description: String
    let temperament: String
    let image: ImageDetails?
}

