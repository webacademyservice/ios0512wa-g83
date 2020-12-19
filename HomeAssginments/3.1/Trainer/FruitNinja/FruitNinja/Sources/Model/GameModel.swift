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


protocol GameViewControllerProtocol {

    func add(fruit: Fruit)
    func remove(fruit: Fruit)
    func move(fruit: Fruit)
    func update(score: Int)

}

class GameModel: GameModelProtocol {

    var fruits: [Fruit] = []
    let timetInterval: TimeInterval = 0.1
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
            controller?.move(fruit: eachFruit)
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

}


