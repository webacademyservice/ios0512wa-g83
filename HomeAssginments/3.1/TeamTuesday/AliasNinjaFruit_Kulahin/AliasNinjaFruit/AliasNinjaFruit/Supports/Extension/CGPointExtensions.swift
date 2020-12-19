//
//  CGPointExtensions.swift
//  AliasNinjaFruit
//
//  Created by Oleksandr Kulahin on 19.12.2020.
//

import CoreGraphics

extension CGPoint{
    
static func + (leftvar: CGPoint, rightvar: CGPoint)->CGPoint{
    return CGPoint(x:leftvar.x+rightvar.x,y:leftvar.y+rightvar.y)
    }
}
