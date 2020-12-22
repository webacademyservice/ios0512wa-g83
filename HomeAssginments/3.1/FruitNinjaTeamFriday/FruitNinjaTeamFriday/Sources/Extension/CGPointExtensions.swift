//
//  CGPointExtensions.swift
//  FruitNinjaTeamFriday
//
//  Created by Alex Mkoff on 12/20/20.
//

import CoreGraphics


extension CGPoint {
    
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y - rhs.y)
    }
}
