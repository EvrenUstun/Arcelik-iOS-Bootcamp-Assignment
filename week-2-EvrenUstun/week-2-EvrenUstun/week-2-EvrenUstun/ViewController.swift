//
//  ViewController.swift
//  week-2-EvrenUstun
//
//  Created by Evren Ustun on 25.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UIButton
    @IBOutlet weak var chooseDriverButton: UIButton!
    @IBOutlet weak var chooseTeamButton: UIButton!
    
    // MARK: - UILabel
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var driverLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as! UINavigationController
        let destController = navController.topViewController as! SelectionTableViewController
        
        // For driver button.
        if segue.identifier == "driverSegue"{
            destController.listType = .drivers
            destController.selectedItem = chooseDriverButton.titleLabel?.text
        }
        
        // For team button.
        if segue.identifier == "teamSegue"{
            destController.listType = .teams
            destController.selectedItem = chooseTeamButton.titleLabel?.text
        }
        
        // Assign the velue to the delegate.
        destController.delegate = self
    }
    
}

// extension for confirm to delegate.
extension ViewController: ItemSelectionDelegate{
    func itemSelected(listType: ListType, selectedItem: String) {
        if listType == .drivers{
            chooseDriverButton.setTitle(selectedItem, for: .normal)
        }
        
        if listType == .teams{
            chooseTeamButton.setTitle(selectedItem, for: .normal)
        }
    }
    
}
