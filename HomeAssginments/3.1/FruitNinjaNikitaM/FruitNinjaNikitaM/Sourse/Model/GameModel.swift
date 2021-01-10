//
//  GameModel.swift
//  FruitNinjaNikitaM
//
//  Created by Mac on 22.12.2020.
//

import Foundation
import UIKit

protocol GameModelProtocol {
    
    func start()
    func pause()
    func tap(on: UUID)
}

protocol GameViewControllerProtocol {
    
    func add(fruit: Fruit)
    func remove(fruit: Fruit)
    func move(fruit: Fruit, duration: TimeInterval)
    func update(score: Int)
    
}

class GameModel: GameModelProtocol {
   
    var fruits: [Fruit] = []
    let timeInterval: TimeInterval = 0.1
    let score: Int = 0
    let force = CGPoint(x: 0.0, y: -0.01)
    
    var controller: GameViewControllerProtocol?
    
    var timer: Timer?
    
        //MARK: public
    
    func start() {
        
        guard timer == nil else {
            return
        }
        
        timer = Timer.scheduledTimer(
            withTimeInterval: timeInterval,
            repeats: true,
            block: { [weak self]_ in
                self?.takeTurn()
                
            }
        )
    }
    
    func pause() {
        timer?.invalidate()
        timer = nil
    }
    
    func tap(on: UUID) {
        guard let fruitToCut = fruits.first(where: { $0.id == on }),
              fruitToCut.kind == .apple
              else { return }
        
        cutFruit(fruit: fruitToCut)
    }
    
        //MARK: private
    
    private func takeTurn() {
        checkState()
        moveFruits()
        updateUI()
    }
    
    private func checkState() {
        if fruits.count < 1 {
            throwFruit()
        }
        fruits = fruits.compactMap { fruit -> Fruit? in
            if fruit.position.y < 0 { return nil }
            return fruit
        }
        
    }
    
    private func moveFruits() {
        fruits = fruits.map {
            return self.moveSinglFruit($0)
        }
    }
    
    private func moveSinglFruit(_ fruit: Fruit) -> Fruit {
        return Fruit(
            id: fruit.id,
            kind: fruit.kind,
            position: fruit.position + fruit.vilocity,
            vilocity: fruit.vilocity + force)
    }
    
    
    private func updateUI() {
        for eachFruit in fruits {
            controller?.move(fruit: eachFruit, duration: timeInterval)
        }
    }
    
    private func throwFruit() {
        let fruit = Fruit(
            id: UUID(),
            kind: .apple,
            position: CGPoint(x: -0.4, y: 0),
            vilocity: CGPoint(x: 0.01, y: 0.1)
        )
        fruits.append(fruit)
        controller?.add(fruit: fruit)
    }
    
    private func cutFruit(fruit: Fruit) {
        let halfLeft = Fruit(
            id: UUID(),
            kind: .halfApple,
            position: fruit.position,
            vilocity: CGPoint(x: -0.01, y: 0.01)
        )
        fruits.append(halfLeft)
        controller?.add(fruit: halfLeft)
        
        let halfRight = Fruit(
            id: UUID(),
            kind: .halfApple,
            position: fruit.position,
            vilocity: CGPoint(x: 0.01, y: 0.01)
        )
        fruits.append(halfRight)
        controller?.add(fruit: halfRight)
        
        controller?.remove(fruit: fruit)
        fruits = fruits.filter { $0.id != fruit.id }
    }
}
