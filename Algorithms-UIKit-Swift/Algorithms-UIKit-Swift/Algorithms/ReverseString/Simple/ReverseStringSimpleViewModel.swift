//
//  ReverseStringSimpleViewModel.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-18.
//

import Foundation

struct ReverseStringSimpleViewModel {
}

// MARK: ReverseStringSimpleManagable
extension ReverseStringSimpleViewModel: ReverseStringManagable {
    
    /**
        Reverses an input string

        - Parameters:
            - string: The input string we want to reverse
        - Returns: A string that is the reverse of the input string
        - Complexity: Time: O(n), Space: O(n)
    */
    func reverse(string: String) -> String {
        return string.reduce("", { currentValue, char in
            "\(char)" + currentValue
        })
    }
}
