//
//  ViewController.swift
//  FruitNinja
//
//  Created by Maryna Snigurska on 22/12/2020.
//

import UIKit

class GameViewController: UIViewController {
   
    var game: GameModelProtocol!
    override func viewDidLoad() {
        
        game = GameModel()
        
        
        super.viewDidLoad()
    }
}

extension GameViewControllerProtocol{
    
    //MARK:GameViewControllerProtocol
    
        func var(fruit: Fruit) {
            
        }
        
        func remove(fruit: Fruit) {
            
        }
        
        func move(fruit: Fruit) {
            
        }
        
        func update(score: Int) {
            
        }
        
        //MARK: Private
    private viewFor(fruit:Fruit)  -> UIView {
        return UIView ()
        
    }
        
        
        
    }




