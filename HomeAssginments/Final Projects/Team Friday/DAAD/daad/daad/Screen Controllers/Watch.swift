//
//  Watch.swift
//  daad
//
//  Created by Alex Mkoff on 1/13/21.
//

import Foundation

struct Watch {
    var name: String
    var type: WatchType
}

enum WatchType: String {
    case classicWatch = "Classic Watch"
    case waterproofWatch = "Waterproof Watch"
    case hybridWatch = "Hybrid Watch"
}
