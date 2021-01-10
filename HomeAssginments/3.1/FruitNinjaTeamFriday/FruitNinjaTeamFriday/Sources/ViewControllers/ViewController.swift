//
//  GameModel.swift
//  FruitNinjaTeamFriday
//
//  Created by Alex Mkoff on 12/20/20.
//

import UIKit

protocol GameViewControllerProtocol {

    func add(fruit: Fruit)
    func remove(fruit: Fruit)
    func move(fruit: Fruit, duration: TimeInterval)
    func update(score: Int)

}

class GameViewController: UIViewController  {

    var game: GameModelProtocol!
    var fruitViews: [UUID: UIView] = [:]

    override func viewDidLoad() {

        let game = GameModel()
        game.controller = self

        self.game = game

        self.game.start()

        super.viewDidLoad()
    
    }

}

extension GameViewController: GameViewControllerProtocol{

    //GameViewControllerProtocol
    
    
    func add(fruit: Fruit) {
        let fruitView = viewFor(fruit: fruit)
        view.addSubview(fruitView)
        fruitViews[fruit.id] = fruitView
    }

    func remove(fruit: Fruit) {
        guard let viewToRemove = fruitViews[fruit.id] else { return }

        fruitViews.removeValue(forKey: fruit.id)
        viewToRemove.removeFromSuperview()
    }

    func move(fruit: Fruit, duration: TimeInterval) {
        guard let viewToMove = fruitViews[fruit.id] else { return }

        let newPosition = translate(fruitPosition: fruit.position)

        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: [.curveLinear, .allowUserInteraction]
        ){
            viewToMove.frame.origin = newPosition
        }

    }

    func update(score: Int) {

    }
    // Actions
    @IBAction
    func tap(_ sender: UITapGestureRecognizer) {
        let view = sender.view

        let fruitId = fruitViews
            .first { $0.value == view }?
            .key

        guard let id = fruitId else { return }

        game.tap(on: id)
    }

    // Private
    private func viewFor(fruit: Fruit) -> UIView {
        let imageView = UIImageView(image: imageFor(kind: fruit.kind))
        var frame = imageView.frame
        frame.size = CGSize(width: 90, height: 90)
        frame.origin = translate(fruitPosition: fruit.position)
        imageView.frame = frame
        imageView.isUserInteractionEnabled = true

        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = CGFloat.pi * 2
        animation.duration = 1.5
        animation.repeatCount = .infinity

        imageView.layer.add(animation, forKey: "rotation")

        addGestureRecogniser(to: imageView)
        return imageView

    }

    private func addGestureRecogniser(to view: UIView) {
        let recogniser = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(recogniser)
    }

    private func imageFor(kind: Fruit.Kind) -> UIImage {
        switch kind {
        case .apple:
           return  #imageLiteral(resourceName: "apple")
        case .halfApple:
            return  #imageLiteral(resourceName: "half-apple")
        case .banana:
            return #imageLiteral(resourceName: "banana")
        case .halfBanana:
            return #imageLiteral(resourceName: "half-banana")
        }
    }

    private func translate(fruitPosition: CGPoint) -> CGPoint {
        return CGPoint(
            x: self.view.bounds.size.width * (0.5 + fruitPosition.x),
            y: self.view.bounds.size.height * (1 - fruitPosition.y)
        )
    }

}
    // add randomizer 
    let randomInt = Int.random(in: 0..<100)/100


