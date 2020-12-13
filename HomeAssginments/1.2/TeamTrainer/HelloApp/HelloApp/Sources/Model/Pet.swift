//
//  Pet.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 13/12/2020.
//

import Foundation

protocol PetProtocol: Equatable {
    var name: String { get }
    func description() -> String
}

struct Pet: PetProtocol {
    func description() -> String {
        return "name is \(name)"
    }

    let name: String
}
