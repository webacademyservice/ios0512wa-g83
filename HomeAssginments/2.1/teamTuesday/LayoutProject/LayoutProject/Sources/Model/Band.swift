//
//  Band.swift
//  LayoutProject
//
//  Created by Maryna Snigurska on 18/12/2020.
//

import Foundation
import UIKit
//Protocol for Group
protocol GroupProtocol {
    var allpeople: String { get }
    func showAllPeople() -> String
}

//Extention for GroupProtocol
extension String: GroupProtocol {
    var allpeople: String {
        return self
    }
    
    func showAllPeople() -> String {
        return "string: \(self)"
    }
}

//Structure Band by country
struct Band <MusiciansType: GroupProtocol, AlbumsType> {
    let bandName: String
    let country: String
    var musicians: Array <MusiciansType>
    var allBandAlbums: Array <AlbumsType>
    let description: String
//    var Img: UIImage
    
    // Return band by country
    func bandByCountry() -> String {
        return "\(bandName) is from \(country)"
    }
}
