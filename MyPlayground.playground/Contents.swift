import UIKit
//структура екіпажа

struct CrewStructure {
    var name : String
    var age : Int
    var roleOnShip: String


func description() -> String {
    return "\(name) age is \(age) and he is \(roleOnShip)"
}
}
let ShipCrew: [CrewStructure] = [
    CrewStructure(name: "Vorontsov", age: 28, roleOnShip: "Captain"),
    CrewStructure(name: "Pylypchak", age: 20, roleOnShip: "Michman"),
    CrewStructure(name: "Mushka", age: 23, roleOnShip: "Shturman"),
    CrewStructure(name: "Moroz", age: 24, roleOnShip: "Matros"),
]

for crew in ShipCrew{
    print(crew.description())
}

