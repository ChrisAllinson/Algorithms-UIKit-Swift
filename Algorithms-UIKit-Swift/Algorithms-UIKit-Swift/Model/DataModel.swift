//
//  DataModel.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2023-12-21.
//

import Foundation

protocol DataModelProtocol {
    var listAlgorithmsRows: [ListAlgorithmsRow] { get }
}

final class DataModel: DataModelProtocol {
    
    // MARK: instance properties
    
    var listAlgorithmsRows: [ListAlgorithmsRow] = [
        ListAlgorithmsRow(type: .factorialIteration),
        ListAlgorithmsRow(type: .factorialRecursion),
        ListAlgorithmsRow(type: .fibonacci),
        ListAlgorithmsRow(type: .binarySearch),
        ListAlgorithmsRow(type: .reverseStringSimple),
        ListAlgorithmsRow(type: .reverseStringUsingArray),
        ListAlgorithmsRow(type: .palindromeUsingArray),
        ListAlgorithmsRow(type: .palindromeUsingString),
        ListAlgorithmsRow(type: .palindromes),
        ListAlgorithmsRow(type: .pascalsTriangle)
    ]
}
