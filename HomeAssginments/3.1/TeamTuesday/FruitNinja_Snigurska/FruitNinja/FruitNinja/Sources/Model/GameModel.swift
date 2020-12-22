//
//  GameModel.swift
//  FruitNinja
//
//  Created by Maryna Snigurska on 22/12/2020.
//

import Foundation
import CoreGraphics

protocol GameModelProtocol {
    
    func start()
    func pause()
    func tap(on:UUID )
}

protocol GameViewControllerProtocol {
    
    func add(fruit: Fruit)
    func remove(fruit: Fruit)
    func move(fruit: Fruit)
    func update(score: Int)
}
class GameModel: GameModelProtocol {
    
    var fruit: [Fruit] = []
    let timeInterval: TimeInterval = 1.0
    var score: Int = 0
    let force = CGPoint(x: 0.0, y: -0.01)
    
    // MARK: public
    
    func start() {
        
    }
    
    func pause() {
        
    }
    
    func tap(on: UUID) {
        
    }
    
    
    // MARK: private
    
    // do one move
    private func takeTurn() {
        checkState()
        moveFruits()
        updateUI()
    }
    
    //update status of the game
    private func checkState() {
    
    }
    
    private func moveFruits(){
    }
    
    private func updateUI(){
        
    }
    
}
