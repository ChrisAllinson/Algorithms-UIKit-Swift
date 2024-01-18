//
//  PalindromeUsingArrayViewModel.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-18.
//

import Foundation

struct PalindromeUsingArrayViewModel {
}

// MARK: PalindromeManagable
extension PalindromeUsingArrayViewModel: PalindromeManagable {
    
    /**
        Determines if the input is a palindrome

        - Parameters:
            - string: The input we want to check is a palindrome
        - Returns: Whether or not the input is a palindrome
        - Complexity: Time: O(n), Space: O(n)
    */
    func determineIfPalindrome(_ string: String) -> Bool {
        // sad path
        guard string.count > 0 else {
            return true
        }

        // happy path
        let charArray = Array(string)
        for (index, el) in charArray.enumerated() {
            // stop at 1/2 way
            if (index >= charArray.count / 2) {
                break
            }

            // determine current iteration's left and right characters
            let leftChar = el
            let rightChar = charArray[charArray.count - 1 - index]
            
            // if left and right characters aren't equal, not a palindrome
            if leftChar != rightChar {
                return false
            }
        }
        return true
    }
}
