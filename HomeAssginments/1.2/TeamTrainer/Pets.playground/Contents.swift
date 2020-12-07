struct Pet: Equatable {
    let name: String
}

struct Owner<PetType: Equatable> {
    let pets: Array<PetType>

    func isOwn(pet: PetType) -> Bool  {
        return pets.contains(pet)
    }
}

let owner0 = Owner(pets: [
    "Roger the Rabbit",
    "Bucks Bunny",
])

owner0.isOwn(pet: "Bucks Bunny")
owner0.isOwn(pet: "Porky Pig")

let owner1 = Owner(pets: [
    Pet(name: "Roger the Rabbit"),
    Pet(name: "Bucks Bunny"),
])

owner1.isOwn(pet: Pet(name: "Roger the Rabbit") )

// Incorrect:
//owner0.isOwn(pet: Pet(name: "Roger the Rabbit") )

// Incorrect:
//owner1.isOwn(pet: "Roger the Rabbit")








