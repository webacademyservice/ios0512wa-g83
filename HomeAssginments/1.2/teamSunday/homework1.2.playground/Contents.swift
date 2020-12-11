import UIKit

//1
struct Theatre<TheatreType> {
    let theatreName: TheatreType
    let location: String
    let theatreSpaciousness: Int
    let theatrePlaysAmount: Int
    let isOpenWhileQuarantine: Bool
    
    func checkTheatresSituation() -> String {
        if isOpenWhileQuarantine == true {
            return "It's opened"
        } else {
            return "It's closed"
        }
    }
}

var theatres = [
    Theatre(theatreName: "Theatre of Lesya Ukrainka", location: "Kyiv", theatreSpaciousness: 460, theatrePlaysAmount: 10, isOpenWhileQuarantine: false),
    Theatre(theatreName: "Theatre of Opera and Ballet", location: "Lviv", theatreSpaciousness: 550, theatrePlaysAmount: 7, isOpenWhileQuarantine: true),
    Theatre(theatreName: "National Opera of Ukraine", location: "Kyiv", theatreSpaciousness: 700, theatrePlaysAmount: 12, isOpenWhileQuarantine: false),
    Theatre(theatreName: "Academic Drama Theatre of Taras Shechenko", location: "Ternopil", theatreSpaciousness: 600, theatrePlaysAmount: 6, isOpenWhileQuarantine: false)
]

//2
struct Play<PlayType> {
    let theatreOfPlay : Theatre<String>
    let playTitle: PlayType
    let actors: [String]
    var actorsAmount: Int
    
    func getActorInPlay(actorsName: String) -> String {
        var actorStatus: String
        for eachActor in actors {
            if eachActor.contains(actorsName) {
                actorStatus = "Actor is found"
            } else {
                actorStatus = "Actor isn't found"
            }
            return actorStatus
        }
        return ""
    }
    
}

let plays = [
    Play(theatreOfPlay: theatres[2], playTitle: "Swan Lake", actors: ["John Cena", "Larysa Khorolets", "Sonya Adler", "Oksana Voronina" ], actorsAmount: 4),
    Play(theatreOfPlay: theatres[3], playTitle: "Hamlet", actors: ["a Bunch of"], actorsAmount: 10),
]
//

//3
struct Actor<ActorType> {
    let actorName: ActorType
    let isMale: Bool
    var salary: Int
    var age: Int
    
    func playAsActor(playInTheatre: Play<ActorType>) -> String {
        var actorsWallet = 0;
        let gender: String;
        
        if isMale == true {
            gender = "his"
        } else {
            gender = "her"
        }
        
        if playInTheatre.actors.contains(actorName as! String) {
            actorsWallet += salary;
            return "\(actorName) now has " + String(actorsWallet) + " hryvnas on \(gender) wallet after playing in '\(playInTheatre.playTitle)' at \(playInTheatre.theatreOfPlay.theatreName)"
        } else {
            return "Actor doesn't have to play"
        }
    }
}

let actors = [
    Actor(actorName: "John Cena", isMale: true, salary: 1000, age: 36),
    Actor(actorName: "John Snow", isMale: true, salary: 670, age: 30),
    Actor(actorName: "Volodimir Zelenskiy", isMale: true, salary: 200, age: 40),
    Actor(actorName: "Larysa Khorolets", isMale: false, salary: 600, age: 29),
    Actor(actorName: "Oksana Voronina", isMale: false, salary: 700, age: 32),
    Actor(actorName: "Yanina Sokolova", isMale: false, salary: 500, age: 36),
    Actor(actorName: "Sonya Adler", isMale: false, salary: 420, age: 52),
]

let actorWithouNameButId = Actor(actorName: 12312, isMale: true, salary: 1000, age: 60)

plays[0].getActorInPlay(actorsName: actors[1].actorName)

theatres[0].checkTheatresSituation()
theatres[1].checkTheatresSituation()

actors[3].playAsActor(playInTheatre: plays[0])
print(actorWithouNameButId)
