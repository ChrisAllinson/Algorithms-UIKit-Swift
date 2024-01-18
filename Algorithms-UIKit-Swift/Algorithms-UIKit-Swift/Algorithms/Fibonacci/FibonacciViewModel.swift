//
//  FibonacciViewModel.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-18.
//

import Foundation

protocol FibonacciManagable {
    func calculateNthFibonacciValue(n: UInt) -> UInt
}

struct FibonacciViewModel {
}

// MARK: FibonacciManagable
extension FibonacciViewModel: FibonacciManagable {
    
    /**
        Calculates the value for the desired member of the Fibonacci sequence

        - Parameters:
            - n: The desired member of the Fibonacci sequence
        - Returns: The value for the desired member of the Fibonacci sequence
        - Complexity: Time: O(2^n), Space: (2^n)
    */
    func calculateNthFibonacciValue(n: UInt) -> UInt {
        // edge case
        guard n != 0 else {
            return 0
        }

        // base case
        guard n != 1 else {
            return 1
        }
        guard n != 2 else {
            return 1
        }

        // happy path
        return calculateNthFibonacciValue(n: n - 1) + calculateNthFibonacciValue(n: n - 2)
    }
}
