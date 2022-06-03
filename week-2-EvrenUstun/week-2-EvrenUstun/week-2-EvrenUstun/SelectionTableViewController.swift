//
//  SelectionTableViewController.swift
//  week-2-EvrenUstun
//
//  Created by Evren Ustun on 25.05.2022.
//

import UIKit

let drivers = ["Max Verstappen", "Charles Leclerc", "Lewis Hamilton"]
let teams = ["Red Bull", "Ferrari", "Mercedes"]

// enum for which list is showing.
enum ListType{
    case drivers
    case teams
}

protocol ItemSelectionDelegate: AnyObject {
    func itemSelected(listType: ListType, selectedItem: String)
}

class SelectionTableViewController: UITableViewController {
    
    // MARK: - Variables
    var dataSource: [String]!
    var listType: ListType = .drivers
    var selectedIndex = -1
    var selectedItem: String!
    
    var delegate:ItemSelectionDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        switch listType {
        case .drivers:
            dataSource = drivers
        case .teams:
            dataSource = teams
        }
        
        if let selectedItem = selectedItem{
            if let index = dataSource.firstIndex(of: selectedItem){
                selectedIndex = index
            }
        }

    }
    
    // When done button clicked.
    @IBAction func doneButtonPressed(_ sender: Any) {
        delegate!.itemSelected(listType: listType, selectedItem: dataSource[selectedIndex])
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        // Configure the cell...
        cell.textLabel?.text = dataSource[indexPath.row]
        
        if indexPath.row == selectedIndex{
            cell.accessoryType = .checkmark // when we clicked a row, put a checkmark.
        }else{
            cell.accessoryType = .none
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    
}
