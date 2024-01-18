//
//  ReverseStringBaseViewController.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-18.
//

import UIKit

protocol ReverseStringManagable {
    func reverse(string: String) -> String
}

class ReverseStringBaseViewController: UIViewController {

    // MARK: instance properties
    
    var viewModel: ReverseStringManagable!
    
    // MARK: IBOutlets
    
    @IBOutlet private var enterValueLabel: UILabel!
    @IBOutlet private var enteredValueTextField: UITextField!
    @IBOutlet private var reversedStringLabel: UILabel!
    
    // MARK: lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterValueLabel.text = String(localized: "Enter_Value")
        setReversedStringLabel(reversedString: "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setViewControllerBackButton(title: "Back")
    }
    
    // MARK: private methods
    
    private func calculateReversedString(inputString: String) -> String {
        return viewModel.reverse(string: inputString)
    }
    
    private func setReversedStringLabel(reversedString: String) {
        reversedStringLabel.text = String(localized: "Reversed_String") + " = " + "\(reversedString)"
    }
}

// MARK: UITextFieldDelegate
extension ReverseStringBaseViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let enteredValue = textField.text ?? ""
        let reversedString = calculateReversedString(inputString: enteredValue)
        setReversedStringLabel(reversedString: reversedString)
        textField.resignFirstResponder()
        return true
    }
}
