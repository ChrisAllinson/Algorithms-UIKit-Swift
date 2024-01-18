//
//  FactorialIterationViewController.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-17.
//

import UIKit

class FactorialIterationViewController: FactorialBaseViewController {
    
    // MARK: static properties
    
    private static let nibName = "FactorialBaseViewController"
    
    // MARK: lifecycle methods
    
    static func instantiate(viewModel: FactorialManagable = FactorialIterationViewModel()) -> FactorialIterationViewController {
        let viewController = FactorialIterationViewController.init(nibName: FactorialIterationViewController.nibName, bundle: Bundle.main)
        viewController.viewModel = viewModel
        return viewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController(title: "Factorial_Iteration")
    }
}
