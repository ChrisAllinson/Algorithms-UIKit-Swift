//
//  PascalsTriangleViewModel.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-18.
//

import Foundation

protocol PascalsTriangleManagable {
    func generatePascalsTriangle(row desiredRow: Int) -> [Int]
}

struct PascalsTriangleViewModel {
}

// MARK: PascalsTriangleManagable
extension PascalsTriangleViewModel: PascalsTriangleManagable {
    
    /**
        Generates an array of integers corresponding to desired row of Pascal's triangle

        - Parameters:
            - desiredRow: The row we want from Pascal's triangle
        - Returns: An array of integers corresponding to desired row of Pascal's triangle
        - Complexity: Time: O(n^2), Space: O(n)
    */
    func generatePascalsTriangle(row desiredRow: Int) -> [Int] {
        // sad path
        guard desiredRow > 0 else {
            return []
        }

        // edge cases
        guard desiredRow != 1 else {
            return [1]
        }
        guard desiredRow != 2 else {
            return [1, 1]
        }
        
        // happy path
        var previousRow: [Int] = [1, 1]
        var currentRow: [Int] = []

        for currentRowIndex in 3...desiredRow {
            
            currentRow = []
            
            for currentElementIndex in 0...currentRowIndex-1 {
                if currentElementIndex == 0 {
                    currentRow.append(1)
                    continue
                }
                if currentElementIndex == currentRowIndex - 1 {
                    currentRow.append(1)
                    break
                }
                
                let value = previousRow[currentElementIndex - 1] + previousRow[currentElementIndex]
                currentRow.append(value)
            }
            
            previousRow = currentRow
        }
        
        return currentRow
    }
}
