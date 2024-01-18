//
//  PalindromesViewModel.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-18.
//

import Foundation

protocol PalindromesManagable {
    func determineAllPalindromes(_ string: String) -> [String]
}

struct PalindromesViewModel {
}

// MARK: PalindromesManagable
extension PalindromesViewModel: PalindromesManagable {
    
    /**
        Generates an array of all palindromes found in the input string

        - Parameters:
            - string: The input string we want to find palindromes in
        - Returns: An array of strings consisting of all the palindromes found in the input string
        - Complexity: Time: O(n^3), Space: O(n)
    */
    func determineAllPalindromes(_ string: String) -> [String] {
        // sad path
        guard string.count > 0 else {
            return [""]
        }

        // helper function to determine if a string is a palindrome
        func determineIfPalindrome(_ string: String) -> Bool {
            let charArray = Array(string)
            for (index, char) in charArray.enumerated() {
                if char != charArray[charArray.count - 1 - index] {
                    return false
                }
            }
            return true
        }

        // happy path
        let charArray = Array(string)
        var arrayOfPalindromes: [String] = []
        for i in 0..<charArray.count {
            let char = charArray[i]
            var currentWord: String = "\(char)"
            // add all one letter words to array
            arrayOfPalindromes.append(currentWord)
            for j in (i + 1)..<charArray.count {
                let nextChar = charArray[j]
                currentWord += "\(nextChar)"
                if determineIfPalindrome(currentWord) {
                    // is a palindrome, so add to array
                    arrayOfPalindromes.append(currentWord)
                }
            }
        }
        return arrayOfPalindromes
    }
}
