//
//  ViewController.swift
//  FruitNinja
//
//  Created by Maryna Snigurska on 22/12/2020.
//

import UIKit

class GameViewController: UIViewController{
    
    var game: GameModelProtocol!
    
    var fruitViews: [UUID:UIView] = [:]
    
    
    override func viewDidLoad() {
        
        let game = GameModel()
        game.controller = self
        self.game = game
        self.game.start()
        
        super.viewDidLoad()
    }
}

extension GameViewController: GameViewControllerProtocol{
    
    //MARK:GameViewControllerProtocol
    
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
    
    func move(fruit: Fruit) {
        guard let viewToMove = fruitViews[fruit.id] else { return }
        let newPosition = translate(fruitPosition: fruit.position)
        viewToMove.frame.origin = newPosition
        
    }
    
    func update(score: Int) {
        
    }
    
    
    //MARK: Private
    private func viewFor(fruit:Fruit)  -> UIView {
        let imageView = UIImageView(image: imageFor(kind: fruit.kind))
        var frame = imageView.frame
        frame.size = CGSize(width: 100, height: 100)
        frame.origin = translate(fruitPosition: fruit.position)
        imageView.frame = frame
        return imageView
    }
    
    private func imageFor(kind: Fruit.Kind) -> UIImage {
        switch kind{
        case .apple:
           return #imageLiteral(resourceName: "apple")
        case .halfApple:
           return #imageLiteral(resourceName: "half-apple")
        }
    }
    
    private func translate(fruitPosition:CGPoint) -> CGPoint{
        return CGPoint(
            x: self.view.bounds.size.width * (0.5 + fruitPosition.x),
            y: self.view.bounds.size.height * (1-fruitPosition.y)
        )
    }
    
}



