
protocol PetProtocol: Equatable {
    var name: String { get }
    func description() -> String
}

struct Pet: PetProtocol {
    func description() -> String {
        return "name is \(name)"
    }

    let name: String
}

struct Owner<PetType: PetProtocol> {
    let pets: Array<PetType>

    func isOwn(pet: PetType) -> Bool  {
        return pets.contains(pet)
    }
}

extension String: PetProtocol {
    var name: String {
        return self
    }

    func description() -> String {
        return "string: \(self)"
    }
}

let owner0: Owner<String> = Owner(pets: [
    "Roger the Rabbit",
    "Bucks Bunny",
])

owner0.isOwn(pet: "Bucks Bunny")
owner0.isOwn(pet: "Porky Pig")

typealias PetString = String
typealias PetOwner = Owner<Pet>
typealias OnwerArray = Array<PetOwner>

let owner1 = PetOwner(pets: [
    Pet(name: "Roger the Rabbit"),
    Pet(name: "Bucks Bunny"),
])

extension Array where Element: PetProtocol {

    func bunnies() -> Self {
        return filter({ element -> Bool in
            return element.name.starts(with: "Bucks")
        })
    }

}

let array = [
    "Bucks Bunny"
]

array.bunnies()
