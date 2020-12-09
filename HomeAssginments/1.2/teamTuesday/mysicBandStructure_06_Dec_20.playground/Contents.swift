import UIKit
import Foundation
// some coment
// another coment

//Musician structure

struct Musician<BandName>
{
    var bandName: BandName
    let fullName: String
    let titleInBand: String
    let periodInBand: DateInterval
    //var startYear: Int
    //var endYear: Int

    init(bandName: BandName? = nil,
          fullName: String? = nil,
          titleInBand: String? = nil,
          startYear: Int? = nil,
          endYear: Int? = nil)
    {
        let calendar = Calendar.current
        self.bandName = (bandName)!
        self.fullName = (fullName)!
        self.titleInBand = (titleInBand)!
        //self.startYear = (startYear)!
        //self.endYear = (endYear)!
        self.periodInBand = DateInterval(start: calendar.date(from: DateComponents(year: startYear))!,
                                         end: calendar.date(from: DateComponents(year:endYear))!)
    }
    
    func printInfoAboutMusician()
    {
    
        print("\(bandName): \(fullName) - \(titleInBand)")
    }
}

var musiciansList = [
    Musician(bandName: "Beatels", fullName: "John Lennon", titleInBand: "vocals, guitars, keyboards, harmonica, bass", startYear: 1960, endYear: 1970),
    Musician(bandName: "Beatels", fullName: "Paul McCartney", titleInBand: "vocals, bass, guitars, keyboards, drums", startYear: 1960, endYear: 19700),
    Musician(bandName: "Beatels", fullName: "George Harrison", titleInBand: "guitars, vocals, sitar, keyboards, bass", startYear: 1960, endYear: 1970),
    Musician(bandName: "Beatels", fullName: "Ringo Starr", titleInBand: "drums, percussion, vocals",startYear: 1962, endYear: 1970)
]

for element in musiciansList
{
    element.printInfoAboutMusician()
}
