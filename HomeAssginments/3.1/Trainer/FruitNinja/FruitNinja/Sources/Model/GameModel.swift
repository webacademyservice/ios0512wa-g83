//
//  GameModel.swift
//  FruitNinja
//
//  Created by Mykhailo Vorontsov on 19/12/2020.
//

import Foundation
import CoreGraphics

protocol GameModelProtocol {

    func start()
    func pause()
    func tap(on: UUID)

}

class GameModel: GameModelProtocol {

    var fruits: [Fruit] = []
    let timetInterval: TimeInterval = 0.2
    var score: Int = 0
    let force = CGPoint(x: 0.0, y: -0.01)

    var controller: GameViewControllerProtocol?

    var timer: Timer?

    // MARK: public

    func start() {

        guard timer == nil else { return }

        timer = Timer.scheduledTimer(
            withTimeInterval: timetInterval,
            repeats: true,
            block: { [weak self] _ in
                self?.takeTurn()
            }
        )
    }

    func pause() {
        timer?.invalidate()
        timer = nil
    }

    func tap(on: UUID) {
        
        guard
            let fruitToCut = fruits.first(where: { $0.id == on }),
            fruitToCut.kind == .apple
        else { return }

        cutFruit(fruit: fruitToCut)
    }

    //MARK: private

    private func takeTurn() {
        checkState()
        moveFuits()
        updateUI()
    }

    private func checkState() {
        if fruits.count < 1 {
            throwFruit()
        }
        fruits = fruits.compactMap{ fruit -> Fruit? in
            if fruit.position.y < 0 { return nil}
            return fruit
        }
    }

    private func moveFuits() {
        fruits = fruits.map {
            return self.moveSingleFruit($0)
        }
    }

    private func moveSingleFruit(_ fruit: Fruit) -> Fruit {
        return Fruit(
            id: fruit.id,
            position: fruit.position + fruit.velocity,
            velocity: fruit.velocity + force,
            kind: fruit.kind
        )
    }

    private func updateUI() {
        for eachFruit in fruits {
            controller?.move(fruit: eachFruit, duration: timetInterval)
        }
    }

    private func throwFruit() {
        let fruit = Fruit(
            id: UUID(),
            position: CGPoint(x: -0.4, y: 0),
            velocity: CGPoint(x: 0.01, y: 0.1),
            kind: .apple
        )
        fruits.append(fruit)
        controller?.add(fruit: fruit)
    }

    private func cutFruit(fruit: Fruit) {
        let halfLeft = Fruit(
            id: UUID(),
            position: fruit.position,
            velocity: CGPoint(x: -0.01, y: 0.01),
            kind: .halfApple
        )
        fruits.append(halfLeft)
        controller?.add(fruit: halfLeft)

        let halfRight = Fruit(
            id: UUID(),
            position: fruit.position,
            velocity: CGPoint(x: 0.01, y: 0.01),
            kind: .halfApple
        )
        fruits.append(halfRight)
        controller?.add(fruit: halfRight)

        controller?.remove(fruit: fruit)

        fruits = fruits.filter{ $0.id != fruit.id }
    }

}


