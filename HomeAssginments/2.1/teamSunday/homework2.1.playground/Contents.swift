import UIKit

protocol ActorProtocol {
    var age: String { get }
    func playAsActor() -> String
}

struct Actor<ActorType: ActorProtocol> {
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

extension String: ActorProtocol {
    var age: String {
        return self
    }
    
    func playAsActor() -> String {
        return "string: \(self)"
    }
    
    
}

let actorsList = [
     Actor(actorName: "John Snow", isMale: true, salary: 670, age: 30),
     Actor(actorName: "Volodimir Zelenskiy", isMale: true, salary: 200, age: 40),
     Actor(actorName: "Larysa Khorolets", isMale: false, salary: 600, age: 29),
     Actor(actorName: "Oksana Voronina", isMale: false, salary: 700, age: 32),
     Actor(actorName: "Yanina Sokolova", isMale: false, salary: 500, age: 36),
     Actor(actorName: "Sonya Adler", isMale: false, salary: 420, age: 52),
 ]

struct Show<ActorType> {
    let name: String
    let language: String
    let time: String
    let genre: String
    let premiere: String
    let author: String
    let actors: ActorType
}

let showsList = [
    Show(name: "Fall", language: "English", time: "19:00", genre: "Comedy", premiere: "11.11.21", author:"Mironov A.", actors: actorsList),
     Show(name: "Jan", language: "English", time: "17:00", genre: "Comedy", premiere: "11.01.21", author:"Mironov A.", actors: actorsList)
 ]

struct Theatre <ActorType, ShowType> {
    var theatreName: String
    let city: String
    let stockTicketsPrice: Int
    let actors: ActorType
    let shows: ShowType
}

let threatres = [
    Theatre(theatreName: "Lvivskii Theatre", city: "Lviv", stockTicketsPrice: 1349, actors: actorsList, shows: showsList),
    Theatre(theatreName: "Venetsiya Theatre", city: "Odessa", stockTicketsPrice: 400, actors: actorsList, shows: showsList),
    Theatre(theatreName: "Theatre on Kiev", city: "Kharkiv", stockTicketsPrice: 41230, actors: actorsList, shows: showsList),
    Theatre(theatreName: "Theatre on Lina Kostenko", city: "Kiev", stockTicketsPrice: 100, actors: actorsList, shows: showsList),
    Theatre(theatreName: "Theatre on Lesya Ukrainka", city: "Lviv", stockTicketsPrice: 200, actors: actorsList, shows: showsList),
]

func findTheCheapestTheater<ActorType, ShowType>(avaliableTheatres: [Theatre<ActorType, ShowType>]) -> String {
    var resultedTheaterName = ""
    var price = avaliableTheatres[0].stockTicketsPrice
    for eachTheatre in avaliableTheatres {
        if price > eachTheatre.stockTicketsPrice {
            price = eachTheatre.stockTicketsPrice
            resultedTheaterName = eachTheatre.theatreName
        }
    }
  return "The cheapest theatre you can get costs: \(price) hryvnas for a ticket at \(resultedTheaterName)"
}

actorsList[2].playAsActor()
findTheCheapestTheater(avaliableTheatres: threatres)
