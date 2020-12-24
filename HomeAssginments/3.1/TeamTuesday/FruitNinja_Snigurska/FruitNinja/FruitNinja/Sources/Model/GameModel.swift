//
//  GameModel.swift
//  FruitNinja
//
//  Created by Maryna Snigurska on 22/12/2020.
//

import UIKit

protocol GameModelProtocol {
    
    func start()
    func pause()
    func tap(on:UUID )
}


class GameModel: GameModelProtocol {
    
    var fruits: [Fruit] = []
    let timeInterval: TimeInterval = 1.0
    var score: Int = 0
    let force = CGPoint(x: 0.0, y: -0.01)
    var controller:GameViewControllerProtocol? 
    
    
    var timer: Timer?
    
    // MARK: public
    
    func start() {
        
        guard timer == nil else {return}
        // already started timer
        timer = Timer.scheduledTimer(
            withTimeInterval: timeInterval,
            repeats: true,
            // weak - dont keep in memory if self destructing
            block: { [weak self] _ in
                self?.takeTurn()
                })
    }
    
    func pause() {
        timer?.invalidate()
        timer = nil
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
        //check number of fruits
        if fruits.count < 1{
            throwFruit()
        }
    
    }
    
    private func moveFruits(){
        // Map??
        
        fruits = fruits.map {
            return self.moveSingleFruit($0)
        }
    }
    
    //Create new fruit
    private func moveSingleFruit(_ fruit: Fruit) ->Fruit{
        return Fruit(
            id: fruit.id,
            position: fruit.position + fruit.velocity,
            velocity: fruit.velocity + force,
            kind: fruit.kind
        )
    }
    
    
    private func updateUI(){
        for eachFruit in fruits{
            controller?.move(fruit: eachFruit)
        }
    }
    
    private func throwFruit(){
        let fruit = Fruit(
            id: UUID(),
            position:CGPoint(x: -0.4, y: 0),
            velocity: CGPoint(x: 0.01, y: 0.1),
            kind: .apple
            )
            fruits.append(fruit)
            controller?.add(fruit: fruit)
    }
   
    
}
