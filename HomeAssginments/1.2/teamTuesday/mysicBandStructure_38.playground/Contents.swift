import UIKit
struct Band <MusiciansType, AlbumsType> {
    let name: String
    let country: String
    let musiciansInBand: Array <MusiciansType>
    var albumsOfBand: Array <AlbumsType>
    func bandByCountry() -> String {
        return "\(name)\" is from \(country)"
}}
let bandsList = [Band(name: "The Beatles", country: "United Kingdom", musiciansInBand: ["John Lennon", "Paul McCartney", "Ringo Starr", "George Harrison"], albumsOfBand: ["Something New", "Beatles 65", "Beatles VI"]),
                 Band(name: "Guns and Roses", country: "United States", musiciansInBand:[], albumsOfBand: []),
                 Band(name: "Scorpions", country: "Germany", musiciansInBand: [], albumsOfBand: []),
                 Band(name: "ABBA", country: "Sweden", musiciansInBand: [], albumsOfBand: [])
]
