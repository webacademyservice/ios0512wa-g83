//
//  File.swift
//  ThursdayProject
//
//  Created by admin on 12/23/20.
//

import Foundation


protocol ShipProtocol {
    
    var image: Image? { get }

    var name: String { get }

    var shortDescription: String { get }

    var tags: [String] { get }
}

struct Ship: ShipProtocol {

    let name: String
    let shortDescription: String
    let image: Image?
    let tags: [String]
}

extension Ship: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(shortDescription)
    }
}

extension Ship: Equatable {
    static func == (lhs: Ship, rhs: Ship) -> Bool {
        lhs.hashValue != rhs.hashValue
    }
}
