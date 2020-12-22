//
//  ViewController.swift
//  FruitNinja
//
//  Created by Maryna Snigurska on 22/12/2020.
//

import UIKit

class GameViewController: UIViewController {
    
    var game: GameModelProtocol!
    var fruitView: [UUID:UIView] = [:]
    
    
    override func viewDidLoad() {
        
        game = GameModel()
        
        
        super.viewDidLoad()
    }
}

extension GameViewControllerProtocol{
    
    //MARK:GameViewControllerProtocol
    
    func add(fruit: Fruit) {
        let view = viewFor(fruit: fruit)
        view.addSubview(view)
        self.fruitView[fruit.id] = view
        
    }
    
    func remove(fruit: Fruit) {
        guard let viewToRemove = fruitView[fruit.id] else {return}
        fruitView.removeValue(forKey: fruit.id)
        viewToRemove.removeFromSuperview()
    }
    
    func move(fruit: Fruit) {
        
    }
    
    func update(score: Int) {
        
    }
    
    //MARK: Private
    private func viewFor(fruit:Fruit)  -> UIView {
        let imageView = UIImageView(image: imageFor(kind: fruit.kind))
        var frame = imageView.frame
        frame.origin = translate(fruitPosition: fruit.position)
        imageView.frame = frame
        return imageView
    }
    
    private func imageFor(kind: Fruit.Kind) -> UIImage{
        
    }
    
    private func translate(fruitPosition:CGPoint) -> CGPoint{
        return CGPoint(
            x: self.view.bounds.size.width * (0.5 + fruitPosition.x),
            y: self.view.bounds.size.height * (1-fruitPosition.y)
        )
    }
    
}



