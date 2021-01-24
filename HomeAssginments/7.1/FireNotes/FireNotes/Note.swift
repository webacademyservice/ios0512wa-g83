//
//  Note.swift
//  FireNotes
//
//  Created by Mykhailo Vorontsov on 24/01/2021.
//

import Foundation

struct Note: Codable {
    let note: String
    let date: Date
    let authorID: String
    let isPublic: Bool
}
