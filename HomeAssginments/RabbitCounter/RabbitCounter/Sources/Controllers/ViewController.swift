//
//  ViewController.swift
//  RabbitCounter
//
//  Created by Mykhailo Vorontsov on 16/01/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!

    @IBOutlet weak var timeoutLabel: UILabel!

    @IBOutlet weak var inputTextField: UITextField!


    lazy var counter: FibonacciCounting = {
        FibonacciCounter()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTyped(_ sender: UITextField) {

        guard let text = sender.text, let value = Int(text) else {
            resultLabel.text = "Введите число!"
            return
        }

        DispatchQueue.global(qos: .utility).async { [weak self] in

            guard let self = self else { return }

            let before = Date()
            let result = self.counter.count(for: value)
            let after = Date()

            let interval = after.timeIntervalSince(before)

            DispatchQueue.main.async { [weak self] in
                self?.timeoutLabel.text = String(interval)
                self?.resultLabel.text = "Кроликов: \(result)"
            }
        }

    }

}

