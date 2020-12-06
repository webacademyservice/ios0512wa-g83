import UIKit
struct MusicBand <BandType> {
    var band: BandType
    var country: String

    func bandByCountry() -> String {
        return "\"\(band)\" is from \(country)"
    }
   
}

let bandsList = [
    MusicBand(band: "The Beatles", country: "United Kingdom"),
    MusicBand(band: "Guns n Roses", country: "United States"),
    MusicBand(band: "Scorpions", country: "Germany"),
    MusicBand(band: "ABBA", country: "Sweden"),
    MusicBand(band: "Daft punk", country: "France"),
    MusicBand(band: "Nightwish", country: "Finland"),
    MusicBand(band: "AC/DC", country: "Australia")]


