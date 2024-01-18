//
//  BinarySearchViewController.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2024-01-18.
//

import UIKit

class BinarySearchViewController: UIViewController {
    
    // MARK: static properties
    
    private static let nibName = "BinarySearchViewController"
    
    // MARK: instance properties
    
    var viewModel: BinarySearchManagable!
    
    // MARK: IBOutlets
    
    @IBOutlet private var dataSetLabel: UILabel!
    @IBOutlet private var searchForLabel: UILabel!
    @IBOutlet private var valueSlider: UISlider!
    @IBOutlet private var selectedValueLabel: UILabel!
    @IBOutlet private var wasFoundLabel: UILabel!
    
    // MARK: lifecycle methods

    static func instantiate(viewModel: BinarySearchManagable = BinarySearchViewModel()) -> BinarySearchViewController {
        let viewController = BinarySearchViewController.init(nibName: BinarySearchViewController.nibName, bundle: Bundle.main)
        viewController.viewModel = viewModel
        return viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController(title: "Binary_Search")
        dataSetLabel.text = String(localized: "Data_Set")
        searchForLabel.text = String(localized: "Search_For")
        updateSelectedValueLabel(sliderValue: 0)
        setWasFoundLabel(wasFound: false)
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
        
        let wasFoundCalculation = viewModel.binarySearchFor(Int(intSliderValue), inArray: viewModel.dataSet, leftIndex: 0, rightIndex: viewModel.dataSet.count - 1)
        setWasFoundLabel(wasFound: wasFoundCalculation)
    }
    
    // MARK: private methods
    
    private func updateSliderValue(sliderValue: UInt) {
        valueSlider.value = Float(sliderValue)
    }
    
    private func updateSelectedValueLabel(sliderValue: UInt) {
        selectedValueLabel.text = String(localized: "Selected_Value") + " = " + "\(sliderValue)"
    }
    
    private func setWasFoundLabel(wasFound: Bool) {
        let wasFoundString = wasFound ? "True" : "False"
        wasFoundLabel.text = String(localized: "Was_Found") + " = " + "\(wasFoundString)"
    }
}
