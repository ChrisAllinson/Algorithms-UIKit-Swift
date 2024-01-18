//
//  FactorialIterationViewModel.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-17.
//

import Foundation

struct FactorialIterationViewModel {
}

// MARK: FactorialIterationManagable
extension FactorialIterationViewModel: FactorialManagable {
    
    /**
        Uses iteration to calculate the factorial for an input value
     
        - Parameters:
            - inputValue: The value we want to find the factorial for
        - Returns: The value for the factorial of the input value
        - Complexity: Time: O(n), Space: O(1)
    */
    func calculateFactorial(of inputValue: UInt) -> UInt {
        // edge case
        guard inputValue != 0 else {
            return 1
        }

        // happy path
        var input = inputValue
        var currentFactorialValue: UInt = input
        while input > 1 {
            currentFactorialValue = currentFactorialValue * (input - 1)
            input -= 1
        }
        return currentFactorialValue
    }
}
