//
//  AlgorithmsListViewController.swift
//  Algorithms-UIKit-Swift
//
//  Created by Chris Allinson on 2023-12-21.
//

import UIKit

class AlgorithmsListViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: instance properties
    
    private let dataModel: DataModelProtocol = DataModel()
    
    // MARK: lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationController(title: "Algorithms")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setNavigationControllerBackButton(title: "Back")
    }
}

// MARK: UITableViewDelegate
extension AlgorithmsListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let viewController = FactorialIterationViewController.instantiate()
            navigationController?.pushViewController(viewController, animated: true)
        case 1:
            let viewController = FactorialRecursionViewController.instantiate()
            navigationController?.pushViewController(viewController, animated: true)
        default:
            let viewController = UIViewController()
            navigationController?.pushViewController(viewController, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: UITableViewDataSource
extension AlgorithmsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.listAlgorithmsRows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let algorithmTableViewCell = tableView.dequeueReusableCell(withIdentifier: AlgorithmListTableViewCell.reuseIdentifier, for: indexPath) as? AlgorithmListTableViewCell else {
            return UITableViewCell()
        }
        
        algorithmTableViewCell.cellLabel?.text = dataModel.listAlgorithmsRows[indexPath.row].type.displayName
        return algorithmTableViewCell
    }
}