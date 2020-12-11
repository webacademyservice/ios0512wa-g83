import UIKit

struct Actor<ActorType> {
    let actorName: ActorType
    let isMale: Bool
    var salary: Int
    var age: Int
    
    func playAsActor() -> String {
        var actorsWallet = 0
        let gender: String

        if isMale == true {
            gender = "his"
        } else {
            gender = "her"
        }
        
        actorsWallet += salary;
        return "\(actorName) now has " + String(actorsWallet) + " hryvnas on \(gender) wallet after playing in show"
    }
}

actorsList[2].playAsActor()

let actorsList = [
    Actor(actorName: "John Cena", isMale: true, salary: 1000, age: 36),
    Actor(actorName: "John Snow", isMale: true, salary: 670, age: 30),
    Actor(actorName: "Volodimir Zelenskiy", isMale: true, salary: 200, age: 40),
    Actor(actorName: "Larysa Khorolets", isMale: false, salary: 600, age: 29),
    Actor(actorName: "Oksana Voronina", isMale: false, salary: 700, age: 32),
    Actor(actorName: "Yanina Sokolova", isMale: false, salary: 500, age: 36),
    Actor(actorName: "Sonya Adler", isMale: false, salary: 420, age: 52),
]

actorsList[3].playAsActor()

