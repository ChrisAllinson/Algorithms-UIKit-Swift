//
//  UIViewControllerExtensions.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-17.
//

import UIKit

extension UIViewController {
    
    func setNavigationController(title: String.LocalizationValue) {
        self.title = String(localized: title)
    }
    
    func setNavigationControllerBackButton(title: String.LocalizationValue) {
        self.navigationItem.backButtonTitle = String(localized: title)
    }
    
    func setViewControllerBackButton(title: String.LocalizationValue) {
        guard let navigationController = self.navigationController else {
            return
        }
        
        let numberOfViewControllers = navigationController.viewControllers.count
        let previousViewControllerPosition = numberOfViewControllers - 2
        guard previousViewControllerPosition >= 0 else {
            return
        }
        
        let previousViewController = navigationController.viewControllers[previousViewControllerPosition]
        previousViewController.navigationItem.backButtonTitle = String(localized: title)
    }
}
