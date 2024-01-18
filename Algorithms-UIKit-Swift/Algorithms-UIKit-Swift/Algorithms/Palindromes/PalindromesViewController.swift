//
//  PalindromesViewController.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-18.
//

import UIKit

class PalindromesViewController: UIViewController {

    // MARK: static properties
    
    private static let nibName = "PalindromesViewController"
    
    // MARK: instance properties
    
    var viewModel: PalindromesManagable!
    
    // MARK: IBOutlets
    
    @IBOutlet private var enterValueLabel: UILabel!
    @IBOutlet private var enteredValueTextField: UITextField!
    @IBOutlet private var palindromesLabel: UILabel!
    
    // MARK: lifecycle methods
    
    static func instantiate(viewModel: PalindromesManagable = PalindromesViewModel()) -> PalindromesViewController {
        let viewController = PalindromesViewController.init(nibName: PalindromesViewController.nibName, bundle: Bundle.main)
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController(title: "Palindromes")
        enterValueLabel.text = String(localized: "Enter_Value")
        setPalindromesLabel(palindromes: [""])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setViewControllerBackButton(title: "Back")
    }
    
    // MARK: private methods
    
    private func calculatePalindromes(inputString: String) -> [String] {
        return viewModel.determineAllPalindromes(inputString)
    }
    
    private func setPalindromesLabel(palindromes: [String]) {
        palindromesLabel.text = String(localized: "Palindromes") + " = " + "\(palindromes)"
    }
}

// MARK: UITextFieldDelegate
extension PalindromesViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let enteredValue = textField.text ?? ""
        let palindromes = calculatePalindromes(inputString: enteredValue)
        setPalindromesLabel(palindromes: palindromes)
        textField.resignFirstResponder()
        return true
    }
}
