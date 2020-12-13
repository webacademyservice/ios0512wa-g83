import UIKit
import Foundation

//Protocol of Musician structure

protocol MusicianProtocol{
    var bandName: String {get set}
    var fullName: String {get set}
    var titleInBand: String {get set}
    var periodInBand: DateInterval {get set}
    var musicianHistory: Dictionary<String, DateInterval> {get set}
    func printInfoAboutMusician()
}

struct Musician: MusicianProtocol
{
    var bandName: String
    var fullName: String
    var titleInBand: String
    var periodInBand: DateInterval
    var musicianHistory: Dictionary<String, DateInterval>

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
// Extension
extension Array where Element: MusicianProtocol{
    func musician(nameSearched: String)->Self{
        return filter({element->Bool in return element.fullName.contains(nameSearched)})
        }
    
}

// Band structure

let bandName = "Beatels"
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
             fullName: "Ringo Star",
             titleInBand: "drums, percussion, vocals",
             periodInBand: Musician.generateDateInterval(startYear: 1962, endYear: 1970)
    )
]

for element in musiciansList{
    element.printInfoAboutMusician()
    element.printMusicianHistory()
}

musiciansList.musician(nameSearched: "Star")
