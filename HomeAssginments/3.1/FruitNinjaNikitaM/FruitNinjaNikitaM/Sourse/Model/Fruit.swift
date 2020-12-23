//
//  Fruit.swift
//  FruitNinjaNikitaM
//
//  Created by Mac on 22.12.2020.
//

import Foundation
import UIKit

struct Fruit {
    
    enum Kind {
        case apple
        case halfApple
    }
    
    let id: UUID
    let kind: Kind
    var position: CGPoint
    var vilocity: CGPoint
}
