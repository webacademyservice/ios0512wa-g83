import UIKit
import Foundation

//Musician structure
struct Musician
{
    var musicianHistory: Dictionary<String, DateInterval>
    var bandName: String
    let fullName: String
    let titleInBand: String
    let periodInBand: DateInterval

    init(bandName: String,
          fullName: String,
          titleInBand: String,
          periodInBand: DateInterval)
    {
        self.bandName = bandName
        self.fullName = fullName
        self.titleInBand = titleInBand
        self.periodInBand = periodInBand
        self.musicianHistory = [String: DateInterval]()
        self.musicianHistory.updateValue(periodInBand, forKey: bandName)
    }
    
    //Mutating for changing data in self.musicianHistory
    mutating func addToMusicianHistory(bandName: String, period: DateInterval){
        musicianHistory.updateValue(period, forKey: bandName)
    }
    
    func printInfoAboutMusician()
    {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy"

        print("\(fullName) - \(titleInBand)"
              + " (\(dateFormatterPrint.string(from: periodInBand.start))"
              + "-\(dateFormatterPrint.string(from: periodInBand.end)))")
    }
    
    func printMusicianHistory()
    {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy"
        
        for (keys, value) in musicianHistory{
            print("\(keys) in period \(dateFormatterPrint.string(from: value.start)) - \(dateFormatterPrint.string(from: value.end))")
        }
    }
    
    static func generateDateInterval(startYear: Int, endYear: Int) -> DateInterval
    {
     DateInterval.init(start: Calendar.current.date(from: DateComponents(year:startYear))!,
                       end: Calendar.current.date(from: DateComponents(year:endYear))!)
    }
}

// Band structure
struct Band <MusiciansType, AlbumsType>
{
    let name: String
    let country: String
    var musiciansInBand: Array <MusiciansType>
    var albumsOfBand: Array <AlbumsType>
    
    func printInfoAboutBand()
    {
        print("\(name) - \(country)")
        for item in musiciansInBand
        {
          if let musician = item as? Musician
          {
            musician.printInfoAboutMusician()
            musician.printMusicianHistory()
            print()
          }
        }
    }
}

let bandName = "The Beatles"

var musiciansList = [
    Musician(
        bandName: bandName,
        fullName: "John Lennon",
        titleInBand: "vocals, guitars, keyboards, harmonica, bass",
        periodInBand: Musician.generateDateInterval(startYear: 1960, endYear: 1970)
    ),
    Musician(bandName: bandName,
             fullName: "Paul McCartney",
             titleInBand: "vocals, bass, guitars, keyboards, drums",
             periodInBand: Musician.generateDateInterval(startYear: 1960, endYear: 1970)
    ),
    Musician(bandName: bandName,
             fullName: "George Harrison",
             titleInBand: "guitars, vocals, sitar, keyboards, bass",
             periodInBand: Musician.generateDateInterval(startYear: 1960, endYear: 1970)
    ),
    Musician(bandName: bandName,
             fullName: "Ringo Starr",
             titleInBand: "drums, percussion, vocals",
             periodInBand: Musician.generateDateInterval(startYear: 1962, endYear: 1970)
    )
]

musiciansList[1].addToMusicianHistory(bandName: "The NONE", period: Musician.generateDateInterval(startYear: 1970, endYear: 1975))

let bandTheBeatles = Band(name: bandName, country: "United Kingdom", musiciansInBand: musiciansList, albumsOfBand: ["Something New", "Beatles 65", "Beatles VI"])

bandTheBeatles.printInfoAboutBand()
//Next structure
