//
//  ViewController.swift
//  FruitNinjaTeamFriday
//
//  Created by Alex Mkoff on 12/19/20.
//

import Foundation
import UIKit


class GameViewController: UIViewController, GameViewControllerProtocol {
    
    
    var game: GameModelProtocol!
    var fruitViews: [UUID: UIView] = [:]

    override func viewDidLoad() {
        game = GameModel()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


extension GameViewController: GameViewControllerProtocol {
    
    //MARK: GameViewControllerProtocol

func add(fruit: Fruit) {
    let view = viewFor(fruit: fruit)
    view.addSubview(view)
    self.fruitViews[fruit.id] = view
}


func remove(fruit: Fruit) {
    guard let viewToRemove = fruitViews[fruit.id] else { return }
    
    fruitViews.removeValue(forKey: fruit.id)
    viewToRemove.removeFromSuperview()
}

func move(fruit: Fruit) {
    guard let viewToRemove = fruitViews[fruit.id] else { return }
    
    let newPosition = translate(fruitPostion: fruit.position)
    
    viewToRemove.frame.origin = newPosition
}

func update(score: Int) {
 
    }
    }


//MArk: Private

private func viewFor(fruit: Fruit) -> UIView {
    let imageView = UIImage(image: imageFor(kind: fruit.kind))
    var frame = imageView.frame
    frame.origin = translate(fruitPosition: fruit.position)
    imageView.frame = frame
    return imageView
 //imageView.frame.origin =

}

private func imageFor(kind: Fruit.Kind) -> UIImage {
    switch kind {
    case .apple:
       return #imageLiteral(resourceName: "apple")
    case .halfApple:
        return#imageLiteral(resourceName: "half-apple")
    }
}

    

private func translate(fruitPostion: CGPoint) -> CGPoint {
    return CGPoint(
        x: self.view.bounds.size.width * (0.5 + fruitPostion.x),
        y: self.view.bounds.size.height * (1 - fruitPostion.y)
    )
}


