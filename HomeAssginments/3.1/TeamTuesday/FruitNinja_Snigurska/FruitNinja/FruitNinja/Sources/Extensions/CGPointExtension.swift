//
//  CGPointExtension.swift
//  FruitNinja
//
//  Created by Maryna Snigurska on 22/12/2020.
//

import CoreGraphics

extension CGPoint {
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}
