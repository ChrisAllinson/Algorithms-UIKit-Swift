//
//  ReverseStringSimpleViewController.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-18.
//

import UIKit

class ReverseStringSimpleViewController: ReverseStringBaseViewController {
    
    // MARK: static properties
    
    private static let nibName = "ReverseStringBaseViewController"
    
    // MARK: lifecycle methods
    
    static func instantiate(viewModel: ReverseStringManagable = ReverseStringSimpleViewModel()) -> ReverseStringSimpleViewController {
        let viewController = ReverseStringSimpleViewController.init(nibName: ReverseStringSimpleViewController.nibName, bundle: Bundle.main)
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController(title: "Reverse_String_Simple")
    }
}
