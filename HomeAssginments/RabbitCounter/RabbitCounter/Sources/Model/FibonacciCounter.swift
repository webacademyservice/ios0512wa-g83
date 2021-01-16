//
//  FibonacciCounter.swift
//  RabbitCounter
//
//  Created by Mykhailo Vorontsov on 16/01/2021.
//

import Foundation

protocol FibonacciCounting {

    func count(for: Int) -> Int64
}

class FibonacciCounter: FibonacciCounting {

    func count(for input: Int) -> Int64 {
        guard input > 1 else {
            return 1
        }
        return count(for: input - 1) + count(for: input - 2)
    }
}
