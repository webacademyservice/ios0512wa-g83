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
    
    func getShip() ->Ship {
        return ships.randomElement()!
    
    }
    
    func loadShips() {
        ships = [
            Ship(
                name: "Symphony of the Seas",
                shortDescriptions: "
)
        
        
        
        ]
    }
    
}
