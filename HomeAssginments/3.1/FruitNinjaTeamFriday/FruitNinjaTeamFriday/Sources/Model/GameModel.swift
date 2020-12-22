//
//  GameModel.swift
//  FruitNinjaTeamFriday
//
//  Created by Alex Mkoff on 12/20/20.
//

import Foundation
import CoreGraphics

protocol GameModelProtocol {
 
    
    func start()
    func pause()
    func tap(on: UUID)

}


protocol GameViewControllerProtocol {
    
    func add(fruit: Fruit)
    func remove(fruit: Fruit)
    func move(fruit: Fruit)
    func update(score: Int)
}


class GameModel: GameModelProtocol {
    
    var fruits: [Fruit] = []
    let timeInterval: TimeInterval = 1
    var score: Int = 0
    let force = CGPoint(x: 0.0, y: -0.01)
    
    var timer: Timer?
    
    
    //MARK: public
    
    func start() {
        guard timer == nil else {
         return
        }
        timer = Timer.scheduledTimer(
            withTimeInterval: timeInterval,
            repeats: true,
            block: { [weak self] _ in
                self?.makeTurn()
            })
    }
    
    func pause() {
        timer?.invalidate()
        timer = nil
    }
    
    func tap(on: UUID) {
        <#code#>
    }
    
    
    //MARK: private
    
    private func makeTurn() {
        checkState()
        moveFruits()
        updateUI()
    }
    
    private func checkState() {
        if fruits.count < 1 {
            throwFruit()
        }
        
    }
    
    private func moveFruits() {
        fruits = fruits.map {
            return self.moveSingleFruit(fruit: $0)
            
        }
    }
    
    private func moveSingleFruit(  fruit: Fruit) -> Fruit {
        return Fruit(
            id: fruit.id,
            position: fruit.position + fruit.velocity,
            velocity: fruit.velocity + force,
            kind: fruit.kind)
    }
    
    private func updateUI() {}
    
    private func throwFruit() {
        let fruit = Fruit(
            id: UUID(),
            position: CGPoint(x: -0.4, y: 0),
            velocity: CGPoint(x: 0.01, y: 0.1),
            kind: .apple
        )
        fruits.append(fruit)
    }
    
}
