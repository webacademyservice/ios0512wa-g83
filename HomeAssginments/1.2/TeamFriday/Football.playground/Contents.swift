import UIKit
// Структура Игроков

struct PlayerInfo {
    var name : String
    var speed : Int
    var age: Int
//Запуск Generic
    func description() -> String {
        return "\"\(name)\" speed is \(speed) age is \(age)"
    }
}

//Наполнение generic

let TeamShakhtar: [PlayerInfo] = [
    PlayerInfo(name: "Pyatov", speed: 56, age: 36),
    PlayerInfo(name: "Hritsenko", speed: 66, age: 25),
    PlayerInfo(name: "Marlos", speed: 76, age: 32),
    PlayerInfo(name: "Srna", speed: 71, age: 38),
    PlayerInfo(name: "Dodo", speed: 87, age: 22),
    PlayerInfo(name: "Matvienko", speed: 66, age: 24),
    PlayerInfo(name: "Vitao", speed: 80, age: 20),
    PlayerInfo(name: "Stepanenko", speed: 76, age: 31 ),
    PlayerInfo(name: "Tayson", speed: 85, age: 32),
    PlayerInfo(name: "Konoplyanka", speed: 80, age: 31),
    PlayerInfo(name: "Patrik", speed: 84, age: 29),
    PlayerInfo(name: "Kashtru", speed: 63, age: 59),
    ]

for player in TeamShakhtar {
    print(player.description())
}


// Структура Команды


struct FootballTeam {
    let name: String
    let coach: String
    let players: [PlayerInfo]
    func description() -> String {
        return "\"\(name)\" coach is \(coach) players are \(players)"
    }
}
let shakhtar = FootballTeam (name: "Shakhtar", coach: "Kashtru", players: TeamShakhtar)
print(shakhtar.description())


// Структура Матча


struct FootballMatch {
    let halves : Int
    let time : Int
    let overTime : Int
    let guest : FootballTeam
    let host: FootballTeam
}


    



