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
    var checkedRow = [0,0]
    
    let optionSelections = ["No Preference", "Bloomingdale", "Cayuga", "Clinton" , "Crawfordsville", "Terre Haute" , "MSBHC", "English", "Spanish"]
    
    let cellIdentifier = "OptionCells"
    
    let previousIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionsTable.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        intialSetup()
    }
    
    func intialSetup(){
        print("initial setup")
        let locationSet = defaults.object(forKey:"locationPreference") as! Int
        
        let locationIndex = IndexPath(row: locationSet, section: 0)
        let locationCell = tableView.cellForRow(at: locationIndex)
        locationCell?.accessoryType = .checkmark
        checkedRow[0] = locationSet
        
        let languageIndex = IndexPath(row: 0, section: 1)
        let languageCell = tableView.cellForRow(at: languageIndex)
        languageCell?.accessoryType = .checkmark
        checkedRow[1] = 0
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that con be recreated.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rows = 0
        

        rows = numberOfRows[section]
        
        return rows
    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*
        let currentCell = tableView.cellForRow(at: indexPath)
        let previousCell = tableView.cellForRow(at: previousIndex)
        
        
        if (previousSection == indexPath.section){
          if(previousIndex != indexPath){
            previousCell?.accessoryType = .none
            currentCell?.accessoryType = .checkmark
          }
        }else{
          
        }
        //Set the previous section and index for the next check
        previousSection = indexPath.section
        previousIndex = indexPath
 */
    }
 
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("cell selectino none")
        cell.selectionStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("text setup")
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = optionSelections[indexPath.row]
        return cell
    }
 
 
    
}
