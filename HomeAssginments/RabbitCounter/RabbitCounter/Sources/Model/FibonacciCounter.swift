//
//  FibonacciCounter.swift
//  RabbitCounter
//
//  Created by Mykhailo Vorontsov on 16/01/2021.
//

import Foundation

protocol FibonacciCounting {

    func count(for: Int) -> Int64

    func count(for: Int, callback: @escaping ((Int64) -> ()) )
}

class FibonacciCounter: FibonacciCounting {

    typealias Callback = (Int64) -> ()

//    lazy var queue: DispatchQueue = DispatchQueue.global(qos: .userInitiated)
    lazy var queue: DispatchQueue = DispatchQueue(label: "com.wa.rabbitcounter.serial")

    func count(for input: Int, callback: @escaping (Callback) ) {
        queue.async { [weak self] in
            guard let self = self else { return }

            let result = self.count(for: input)

            DispatchQueue.main.async {
                callback(result)
            }
        }

    }

    func count(for input: Int) -> Int64 {
        guard input > 1 else {
            return 1
        }
        return count(for: input - 1) + count(for: input - 2)
    }
}
