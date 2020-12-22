//
//  File.swift
//  FruitNinja
//
//  Created by Maryna Snigurska on 22/12/2020.
//

import Foundation
import CoreGraphics
//import CoreGraphics.CGPoint

struct Fruit {
    enum Kind {
        case apple
        case halfApple
    }
    
    let id: UUID = UUID()
    var position: CGPoint
    var velocity: CGPoint
    
    let kind: Kind
    
}
