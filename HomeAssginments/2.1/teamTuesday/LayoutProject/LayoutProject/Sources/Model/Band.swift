//
//  Band.swift
//  LayoutProject
//
//  Created by Maryna Snigurska on 18/12/2020.
//

import Foundation

//Protocol for Group
protocol GroupProtocol{
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
    //var Img: UIImage
    // Return band by country
    func bandByCountry() -> String {
        return "\(bandName) is from \(country)"
    }

//let bandsList = [
//    Band(bandName: "The Beatles", country: "United Kingdom",musicians: ["John Lennon", "Paul McCartney", "George Harrison","Ringo Starr"], allBandAlbums: ["With the Beatles", "Beatles 65", "Help!","Magical Mystery Tour"]),
//    Band(bandName: "Guns and Roses", country: "United States", musicians:["Axl Rose", "Duff McKagane", "Slash" ] , allBandAlbums:["Appetite for Destruction", "G N' R Lies", "Use Your Illusion", "The Spaghetti Incident?"]),
//    Band(bandName: "Scorpions", country: "Germany", musicians:["Rudolf Schenker", "Klaus Meine", "Matthias Jabs"] , allBandAlbums:["Lonesome Crow", "In Trance", "Animal Magnetism","Blackout"]),
//]
}
