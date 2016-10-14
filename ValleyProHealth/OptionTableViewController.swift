//
//  OptionTableViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/30/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class OptionTableViewController: UITableViewController {
    
    @IBOutlet var optionsTable: UITableView!
    
    let defaults = UserDefaults.standard
    
    let numberOfRows = [7,2]
    
    let optionSelections = ["No Preference", "Atlanta", "Chicago", "LA" , "New York", "Santa Fe" , "Richmond", "English", "Spanish"]
    
    let cellIdentifier = "OptionCells"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionsTable.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        //intialSetup()
    }
    
    func intialSetup(){
        let locationSet = defaults.object(forKey:"locationPreference") as! Int
        print(locationSet)
        let locationIndex = IndexPath(row: locationSet, section: 0)

        let cell = optionsTable.dequeueReusableCell(withIdentifier: cellIdentifier, for: locationIndex as IndexPath)
        cell.accessoryType = .checkmark
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that con be recreated.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rows = 0
        

        rows = numberOfRows[section]
        
        return rows
    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select")
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        //cell.accessoryType = .checkmark
     
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("DeSelect")
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.accessoryType = .none
        optionsTable.deselectRow(at: indexPath, animated: true)
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("in there")
        cell.selectionStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = optionSelections[indexPath.row]
        return cell
    }
    
 
    
}
