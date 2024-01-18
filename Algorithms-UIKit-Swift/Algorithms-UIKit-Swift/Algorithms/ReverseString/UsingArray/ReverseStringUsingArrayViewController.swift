//
//  ReverseStringUsingArrayViewController.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-18.
//

import UIKit

class ReverseStringUsingArrayViewController: ReverseStringBaseViewController {
    
    // MARK: static properties
    
    private static let nibName = "ReverseStringBaseViewController"
    
    // MARK: lifecycle methods
    
    static func instantiate(viewModel: ReverseStringManagable = ReverseStringUsingArrayViewModel()) -> ReverseStringUsingArrayViewController {
        let viewController = ReverseStringUsingArrayViewController.init(nibName: ReverseStringUsingArrayViewController.nibName, bundle: Bundle.main)
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController(title: "Reverse_String_Using_Array")
    }
}
