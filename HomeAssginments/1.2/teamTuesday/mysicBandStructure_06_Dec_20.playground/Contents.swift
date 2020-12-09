import UIKit
// some coment
// another coment

//Musician structure

struct Musician
{
    let fullName: String
    let titleInBand: String
    let periodInBand: String
    
    func printInfoAboutMusician(){
        print("\(fullName) - \(titleInBand) (\(periodInBand))")
    }
}

var musicianList = [
Musician(fullName: "John Lennon", titleInBand: "vocals, guitars, keyboards, harmonica, bass", periodInBand: "1960-1970"),
    Musician(fullName: "Paul McCartney", titleInBand: "vocals, bass, guitars, keyboards, drums", periodInBand: "1960-1970"),
    Musician(fullName: "George Harrison", titleInBand: "guitars, vocals, sitar, keyboards, bass", periodInBand: "1960-1970"),
    Musician(fullName: "Ringo Starr", titleInBand: "drums, percussion, vocals", periodInBand: "1962-1970")
]

for element in musicianList{
    element.printInfoAboutMusician()
}
