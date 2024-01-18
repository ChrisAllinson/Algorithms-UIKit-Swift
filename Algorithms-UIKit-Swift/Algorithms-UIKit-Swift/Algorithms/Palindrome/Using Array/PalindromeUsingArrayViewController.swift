//
//  PalindromeUsingArrayViewController.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-18.
//

import UIKit

class PalindromeUsingArrayViewController: PalindromeBaseViewController {
    
    // MARK: static properties
    
    private static let nibName = "PalindromeBaseViewController"
    
    // MARK: lifecycle methods
    
    static func instantiate(viewModel: PalindromeManagable = PalindromeUsingArrayViewModel()) -> PalindromeUsingArrayViewController {
        let viewController = PalindromeUsingArrayViewController.init(nibName: PalindromeUsingArrayViewController.nibName, bundle: Bundle.main)
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController(title: "Palindrome_Using_Array")
    }
}
