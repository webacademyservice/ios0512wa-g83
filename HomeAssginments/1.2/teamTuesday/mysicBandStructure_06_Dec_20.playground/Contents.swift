import UIKit
// some coment
// another coment

//Musician structure

struct Musician
{
    var name: String
    var familyName: String
    var age: Int
    var titleInBand: String
    
    func printInfoAboutMusician(){
        print("Name: \(name) \(familyName)\nAge: \(age)\nTitle: \(titleInBand)")
    }
}

var musician: Musician = Musician(name: "Alex", familyName: "Kualhin", age: 31, titleInBand: "Bass")
musician.printInfoAboutMusician()
