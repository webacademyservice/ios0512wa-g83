import UIKit

struct Ship {
   let name: String
   let direction: String
   let teamCapacity: Int
   
   func description() -> String {
       return "Ship \"\(name)\" is going to \(direction) required team size \(teamCapacity)"

   }
}

let ShipInfo = Ship(name:"Titanic", direction:"New-York", teamCapacity: 250)
   

   var List =  [
   Ship(name:"Titanic", direction:"New-York", teamCapacity: 250),
   Ship(name: "Favolosa" , direction: "Oslo", teamCapacity: 200),
   Ship(name: "Splendida", direction: "Barselona", teamCapacity: 150),
   Ship(name: "Smeralda", direction: "Palermo", teamCapacity: 140),
] 
for Ship in List {
    print(Ship.description())
}
