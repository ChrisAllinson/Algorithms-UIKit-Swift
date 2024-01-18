//
//  Algorithm.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2023-12-23.
//

import Foundation

enum Algorithm {
    case factorialIteration
    case factorialRecursion
    case fibonacci
    
    var displayName: String {
        switch self {
        case .factorialIteration:
            return String(localized: "Factorial_Iteration")
        case .factorialRecursion:
            return String(localized: "Factorial_Recursion")
        case .fibonacci:
            return String(localized: "Fibonacci")
        }
    }
}
