//
//  Fruit.swift
//  FruitNinjaTeamFriday
//
//  Created by Alex Mkoff on 12/20/20.
//

import Foundation
import UIKit

struct Fruit {
    
    enum Kind {
        case apple
        case halfApple
        case banana
        case halfBanana
    }
    
    var id: UUID
    var position: CGPoint
    var velocity: CGPoint
    var kind: Kind
    
}
