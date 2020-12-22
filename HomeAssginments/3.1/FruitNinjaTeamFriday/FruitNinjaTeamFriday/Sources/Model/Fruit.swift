//
//  Fruit.swift
//  FruitNinjaTeamFriday
//
//  Created by Alex Mkoff on 12/20/20.
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
