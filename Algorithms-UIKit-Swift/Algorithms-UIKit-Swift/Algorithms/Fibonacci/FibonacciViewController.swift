//
//  FibonacciViewController.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-18.
//

import UIKit

class FibonacciViewController: UIViewController {
    
    // MARK: static properties
    
    private static let nibName = "FibonacciViewController"
    
    // MARK: instance properties
    
    var viewModel: FibonacciManagable!

    // MARK: IBOutlets
    
    @IBOutlet private var selectValueLabel: UILabel!
    @IBOutlet private var valueSlider: UISlider!
    @IBOutlet private var selectedValueLabel: UILabel!
    @IBOutlet private var calculationLabel: UILabel!
    
    // MARK: lifecycle methods
    
    static func instantiate(viewModel: FibonacciManagable = FibonacciViewModel()) -> FibonacciViewController {
        let viewController = FibonacciViewController.init(nibName: FibonacciViewController.nibName, bundle: Bundle.main)
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController(title: "Fibonacci")
        selectValueLabel.text = String(localized: "Select_A_Value")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setViewControllerBackButton(title: "Back")
    }
    
    // MARK: IBActions
    
    @IBAction private func slideValueUpdated(sender: UISlider) {
        let roundedSliderValue = round(sender.value)
        let intSliderValue = UInt(roundedSliderValue)
        
        updateSliderValue(sliderValue: intSliderValue)
        updateSelectedValueLabel(sliderValue: intSliderValue)
        
        let calculation = viewModel.calculateNthFibonacciValue(n: intSliderValue)
        setCalculationLabel(calculation: calculation)
    }
    
    // MARK: private methods
    
    private func updateSliderValue(sliderValue: UInt) {
        valueSlider.value = Float(sliderValue)
    }
    
    private func updateSelectedValueLabel(sliderValue: UInt) {
        selectedValueLabel.text = String(localized: "Selected_Value") + " = " + "\(sliderValue)"
    }
    
    private func setCalculationLabel(calculation: UInt) {
        calculationLabel.text = String(localized: "Fibonacci_Member") + " = " + "\(calculation)"
    }
}
