//
//  PascalsTriangleViewController.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-18.
//

import UIKit

class PascalsTriangleViewController: UIViewController {
    
    // MARK: static properties
    
    private static let nibName = "PascalsTriangleViewController"
    
    // MARK: instance properties
    
    var viewModel: PascalsTriangleManagable!

    // MARK: IBOutlets
    
    @IBOutlet private var selectValueLabel: UILabel!
    @IBOutlet private var valueSlider: UISlider!
    @IBOutlet private var selectedValueLabel: UILabel!
    @IBOutlet private var calculationLabel: UILabel!
    
    // MARK: lifecycle methods
    
    static func instantiate(viewModel: PascalsTriangleManagable = PascalsTriangleViewModel()) -> PascalsTriangleViewController {
        let viewController = PascalsTriangleViewController.init(nibName: PascalsTriangleViewController.nibName, bundle: Bundle.main)
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController(title: "Pascals_Triangle")
        selectValueLabel.text = String(localized: "Select_A_Value")
        updateSelectedValueLabel(sliderValue: 0)
        setCalculationLabel(calculation: [0])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setViewControllerBackButton(title: "Back")
    }
    
    // MARK: IBActions
    
    @IBAction private func sliderValueUpdated(sender: UISlider) {
        let roundedSliderValue = round(sender.value)
        let intSliderValue = Int(roundedSliderValue)
        
        updateSliderValue(sliderValue: intSliderValue)
        updateSelectedValueLabel(sliderValue: intSliderValue)
        
        let calculation = viewModel.generatePascalsTriangle(row: intSliderValue)
        setCalculationLabel(calculation: calculation)
    }
    
    // MARK: private methods
    
    private func updateSliderValue(sliderValue: Int) {
        valueSlider.value = Float(sliderValue)
    }
    
    private func updateSelectedValueLabel(sliderValue: Int) {
        selectedValueLabel.text = String(localized: "Selected_Value") + " = " + "\(sliderValue)"
    }
    
    private func setCalculationLabel(calculation: [Int]) {
        calculationLabel.text = String(localized: "Pascals_Triangle_Row") + " = " + "\(calculation)"
    }
}
