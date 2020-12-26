//
//  StorageService.swift
//  ThursdayProject
//
//  Created by admin on 12/23/20.
//

import Foundation

protocol StorageServiceProtocol {
        func getShip() -> Ship
        func loadShips()
}

class StorageService: StorageServiceProtocol {
    
    private var ships: [Ship] = []
    
    func getShip() -> Ship {
        return ships.randomElement()!
    }
    
    func loadShips() {
        ships = [
            Ship(
                name: "Symphony of the Seas",
                shortDescription: "Symphony of the Seas is an Oasis-class cruise ship owned and operated by Royal Caribbean International.[8] She was built in 2018 in the Chantiers de l'Atlantique shipyard in Saint-Nazaire, France,[9] the fourth in Royal Caribbean's Oasis class of cruise ships.[10] At 228,081 GT, she is the largest cruise ship in the world by gross tonnage, surpassing her sister ship Harmony of the Seas, also owned by Royal Caribbean International.",
                image: #imageLiteral(resourceName: "Symphony of the Seas"),
                tags: ["Nassau, Bahamas"]
                ),
            Ship(
                     name: "Harmony of the Seas",
                     shortDescription: "Harmony of the Seas is an Oasis-class cruise ship built by STX France at the Chantiers de l'Atlantique shipyard in Saint-Nazaire, France,[citation needed] for Royal Caribbean International. With a gross tonnage of 226,963 GT,[2] she is the second largest passenger ship in the world, larger than her older sisters Oasis of the Seas and Allure of the Seas, but surpassed by her newer sister Symphony of the Seas. In length, however, Harmony of the Seas is the longest cruise ship in the world.",
                     image:#imageLiteral(resourceName: "Harmony of the Seas"),
                    tags: ["Nassau,Bahamas"]
                ),
            Ship(
                name: "Oasis of the Seas",
                 shortDescription: "Oasis of the Seas is a cruise ship operated by Royal Caribbean International. She is the first of her class, whose ships are the largest passenger ships in the world. Her hull was laid down in November 2007 and she was completed and delivered to Royal Caribbean in October 2009. At the time of construction, Oasis of the Seas set a new capacity record of carrying over 6,000 passengers.",
                image: #imageLiteral(resourceName: "Oasis of the Seas"),
                 tags: ["Nassau,Bahamas"]
                ),
            Ship(
                name: "Liberty of the Seas",
                shortDescription: "Liberty of the Seas is a Royal Caribbean International Freedom-class cruise ship which entered regular service in May 2007. It was initially announced that she would be called Endeavour of the Seas, however this name was later changed.[4] The 15-deck ship accommodates 3,634 passengers served by 1,360 crew. She was built in 18 months at the Aker Finnyards Turku Shipyard, Finland, where her sister ship, Freedom of the Seas, was also built. Initially built at 154,407 gross tonnage (GT), she joined her sister ship, Freedom of the Seas, as the largest cruise ships and passenger vessels then ever built. ",
                image: #imageLiteral(resourceName: "Liberty of the Seas"),
                tags: ["Nassau,Bahamas"]
            ),
        ]
    }
}
        
    
        
       
    
        
        
        
        

    

