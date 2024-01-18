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
    case binarySearch
    case reverseStringSimple
    case reverseStringUsingArray
    case palindromeUsingArray
    case palindromeUsingString
    
    var displayName: String {
        switch self {
        case .factorialIteration:
            return String(localized: "Factorial_Iteration")
        case .factorialRecursion:
            return String(localized: "Factorial_Recursion")
        case .fibonacci:
            return String(localized: "Fibonacci")
        case .binarySearch:
            return String(localized: "Binary_Search")
        case .reverseStringSimple:
            return String(localized: "Reverse_String_Simple")
        case .reverseStringUsingArray:
            return String(localized: "Reverse_String_Using_Array")
        case .palindromeUsingArray:
            return String(localized: "Palindrome_Using_Array")
        case .palindromeUsingString:
            return String(localized: "Palindrome_Using_String")
        }
    }
}
