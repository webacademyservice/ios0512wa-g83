//
//  Fruit.swift
//  FruitNinja
//
//  Created by Mykhailo Vorontsov on 19/12/2020.
//

import Foundation
import UIKit
//import CoreGraphics.CGPoint

struct Fruit {
    enum Kind {
        case apple
        case halfApple
    }
    
    let id: UUID
    var position: CGPoint
    var velocity: CGPoint
    let kind: Kind
}
