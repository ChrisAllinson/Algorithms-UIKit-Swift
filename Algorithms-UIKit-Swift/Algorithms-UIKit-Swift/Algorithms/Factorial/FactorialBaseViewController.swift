//
//  FactorialBaseViewController.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-17.
//

import UIKit

protocol FactorialManagable {
    func calculateFactorial(of inputValue: UInt) -> UInt
}

class FactorialBaseViewController: UIViewController {
    
    // MARK: instance properties
    
    var viewModel: FactorialManagable!
    
    // MARK: IBOutlets
    
    @IBOutlet private var selectValueLabel: UILabel!
    @IBOutlet private var valueSlider: UISlider!
    @IBOutlet private var calculationLabel: UILabel!
    
    // MARK: lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectValueLabel.text = String(localized: "Select_A_Value")
        updateSliderValue(sliderValue: 0)
        setCalculationLabel(sliderValue: 0, calculation: 1)
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
        
        let calculation = viewModel.calculateFactorial(of: intSliderValue)
        setCalculationLabel(sliderValue: intSliderValue, calculation: calculation)
    }
    
    // MARK: private methods
    
    private func updateSliderValue(sliderValue: UInt) {
        valueSlider.value = Float(sliderValue)
    }
    
    private func setCalculationLabel(sliderValue: UInt, calculation: UInt) {
        calculationLabel.text = "\(sliderValue)" + "! = " + "\(calculation)"
    }
}
