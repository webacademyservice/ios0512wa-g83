import UIKit
struct MusicBand <BandType> {
    let name: BandType
    let country: String

    func bandByCountry() -> String {
        return "\"\(name)\" is from \(country)"
    }
   
}

let bandsList = [
    MusicBand(name: "The Beatles", country: "United Kingdom"),
    MusicBand(name: "Guns n Roses", country: "United States"),
    MusicBand(name: "Scorpions", country: "Germany"),
    MusicBand(name: "ABBA", country: "Sweden"),
    MusicBand(name: "Daft punk", country: "France"),
    MusicBand(name: "Nightwish", country: "Finland"),
    MusicBand(name: "AC/DC", country: "Australia")
            ]    





