//
//  Pet.swift
//  HelloApp
//
//  Created by Mykhailo Vorontsov on 13/12/2020.
//

import Foundation

protocol PetProtocol {
    /**
     Картинка. Опциональна
     Тип Image перезадан в "UIImageExtensions.swift"
     что бы можно было использовать в модели без подключения UIKit
     */
    var image: Image? { get }

    /// Имя для
    var name: String { get }

    /// Короткое описание
    var shortDescription: String { get }


    /// теги
    var tags: [String] { get }
}

struct Pet: PetProtocol {

    let name: String
    let shortDescription: String
    let image: Image?
    let tags: [String]
}

extension Pet: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(shortDescription)
    }
}

extension Pet: Equatable {
    static func == (lhs: Pet, rhs: Pet) -> Bool {
        lhs.hashValue != rhs.hashValue
    }
}
