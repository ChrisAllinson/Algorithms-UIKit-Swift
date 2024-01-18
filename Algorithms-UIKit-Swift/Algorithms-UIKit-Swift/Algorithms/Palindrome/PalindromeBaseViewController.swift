//
//  PalindromeBaseViewController.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-18.
//

import UIKit

protocol PalindromeManagable {
    func determineIfPalindrome(_ string: String) -> Bool
}

class PalindromeBaseViewController: UIViewController {

    // MARK: instance properties
    
    var viewModel: PalindromeManagable!
    
    // MARK: IBOutlets
    
    @IBOutlet private var enterValueLabel: UILabel!
    @IBOutlet private var enteredValueTextField: UITextField!
    @IBOutlet private var isPalindromeLabel: UILabel!
    
    // MARK: lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterValueLabel.text = String(localized: "Enter_Value")
        setIsPalindromeLabel(isPalindrome: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setViewControllerBackButton(title: "Back")
    }
    
    // MARK: private methods
    
    private func determineIfPalindrome(inputString: String) -> Bool {
        return viewModel.determineIfPalindrome(inputString)
    }
    
    private func setIsPalindromeLabel(isPalindrome: Bool) {
        let isPalindromeString = isPalindrome ? String(localized: "True") : String(localized: "False")
        isPalindromeLabel.text = String(localized: "Is_A_Palindrome") + " = " + "\(isPalindromeString)"
    }
}

// MARK: UITextFieldDelegate
extension PalindromeBaseViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let enteredValue = textField.text ?? ""
        let isPalindrome = determineIfPalindrome(inputString: enteredValue)
        setIsPalindromeLabel(isPalindrome: isPalindrome)
        textField.resignFirstResponder()
        return true
    }
}
