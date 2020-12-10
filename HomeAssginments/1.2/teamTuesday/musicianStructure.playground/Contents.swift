import UIKit
import Foundation
// some coment
// another coment

//Musician structure

struct Musician<BandName>
{
    var musicianHistory: Dictionary<DateInterval, BandName>
    var bandName: BandName
    let fullName: String
    let titleInBand: String
    let periodInBand: DateInterval

    init(bandName: BandName,
          fullName: String,
          titleInBand: String,
          periodInBand: DateInterval)
    {
        self.bandName = bandName
        self.fullName = fullName
        self.titleInBand = titleInBand
        self.periodInBand = periodInBand
        self.musicianHistory = Dictionary<DateInterval, BandName>()
        self.musicianHistory.updateValue(bandName, forKey: periodInBand)
    }
    
    func printInfoAboutMusician()
    {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy"

        print("\(bandName): \(fullName) - \(titleInBand)"
              + " (\(dateFormatterPrint.string(from: periodInBand.start))"
              + "-\(dateFormatterPrint.string(from: periodInBand.end)))")
    }
    
    static func generateDateInterval(startYear: Int, endYear: Int) -> DateInterval
    {
     DateInterval.init(start: Calendar.current.date(from: DateComponents(year:startYear))!,
                       end: Calendar.current.date(from: DateComponents(year:endYear))!)
    }
}

var musiciansList = [
    Musician(
        bandName: "Beatels",
        fullName: "John Lennon",
        titleInBand: "vocals, guitars, keyboards, harmonica, bass",
        periodInBand: Musician<Any>.generateDateInterval(startYear: 1960, endYear: 1970)
    ),
    Musician(bandName: "Beatels",
             fullName: "Paul McCartney",
             titleInBand: "vocals, bass, guitars, keyboards, drums",
             periodInBand: Musician<Any>.generateDateInterval(startYear: 1960, endYear: 1970)
    ),
    Musician(bandName: "Beatels",
             fullName: "George Harrison",
             titleInBand: "guitars, vocals, sitar, keyboards, bass",
             periodInBand: Musician<Any>.generateDateInterval(startYear: 1960, endYear: 1970)
    ),
    Musician(bandName: "Beatels",
             fullName: "Ringo Starr",
             titleInBand: "drums, percussion, vocals",
             periodInBand: Musician<Any>.generateDateInterval(startYear: 1962, endYear: 1970)
    )
]

for element in musiciansList
{
    element.printInfoAboutMusician()
}
//Next structure
