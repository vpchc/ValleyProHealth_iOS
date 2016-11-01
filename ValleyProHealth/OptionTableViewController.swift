//
//  OptionTableViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/30/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit
import Toast_Swift

class OptionTableViewController: UITableViewController {
    // MARK: - Outlets -
    // MARK: TableViews
    @IBOutlet var optionsTable: UITableView!
    
    // MARK: - Global Variables -
    // MARK: Arrays
    var checkedRow = [IndexPath]()
    let languageSelection = [
        NSLocalizedString("English", comment: "Options Language Selection"),
        NSLocalizedString("Spanish", comment: "Options Language Selection")]
    let locationSelection = [
        NSLocalizedString("No Preference", comment: "Options Location Selection"),
        "Bloomingdale", "Cayuga", "Clinton" , "Crawfordsville", "Terre Haute" , "MSBHC"]
    let numberOfRows = [7,2]
    // MARK: Defaults
    let defaults = UserDefaults.standard
    // MARK: Ints
    let previousIndex = 0
    // MARK: Strings
    let cellIdentifier = "OptionCells"
    let toastSaveNoChanges = NSLocalizedString("No changes to save", comment: "Toast Options Save No Changes")
    
    
    // MARK: - View Lifecylce -
    override func viewDidLoad() {
        super.viewDidLoad()
        optionsTable.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation Buttons -
    func saveChanges(){
    /*
         Arguments: None
         Description: Checks if changes were made and then saves them in the appropriate default
         Returns: Nothing
    */
        let savedLocation = defaults.object(forKey:"locationPreference") as! Int
        let languageSet = defaults.object(forKey:"savedLocale") as! String
        var languageSetInt = 0
        var changes = false
        
        if(languageSet == "en"){
            languageSetInt = 0
        }else{
            languageSetInt = 1
        }
        
        if(savedLocation != checkedRow[0].row){// Location Preference Change
            defaults.set(checkedRow[0].row, forKey: "locationPreference")
            changes = true
        }
    
        if(languageSetInt != checkedRow[1].row){// Language Change
            var newLocale = "en"
            if(checkedRow[1].row == 0){
                newLocale = "en"
            }else{
                newLocale = "es"
            }
            // Sets the new locale when the user restarts the app
            defaults.set(newLocale, forKey: "savedLocale")
            UserDefaults.standard.set([newLocale], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
            changes = true
        }
        
        // If changes were made, dismiss, otherwise let the user know of no changes
        if(changes){
            self.dismiss(animated: true, completion: nil)
        }else{
            self.view.makeToast(toastSaveNoChanges)
        }
    }
    
    // MARK: - TableView Setup -
    // Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    // Number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rows = 0
        rows = numberOfRows[section]
        return rows
    
    }
    // Row selection
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Checking newly tapped rows and un-checking previous ones
        if (indexPath.section == 0){// Location Preference Section
          if (indexPath != checkedRow[0]){
            // Check the newly tapped cell and un-check the previous
            let previousCell = tableView.cellForRow(at: checkedRow[0])
            let currentCell = tableView.cellForRow(at: indexPath)
            previousCell?.accessoryType = .none
            currentCell?.accessoryType = .checkmark
            
            //Set newly checked cell to compare
            checkedRow[0] = indexPath
          }
        }else{// Language Section
            if (indexPath != checkedRow[1]){
              // Check the newly tapped cell and un-check the previous
              let previousCell = tableView.cellForRow(at: checkedRow[1])
              let currentCell = tableView.cellForRow(at: indexPath)
              previousCell?.accessoryType = .none
              currentCell?.accessoryType = .checkmark
                
              //Set newly checked cell to compare
              checkedRow[1] = indexPath
            }
        }
    }
    // Cell create
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Initial set of location preference and language when displaying the table
        if(indexPath.section == 0){// Location Preference Section
          let locationSet = defaults.object(forKey:"locationPreference") as! Int
            if(indexPath.row == locationSet){
                cell.accessoryType = .checkmark
                checkedRow.append(indexPath)
            }
        }else{// Language Section
          let languageSet = defaults.object(forKey:"savedLocale") as! String
          var languageCompare = 0
            if(languageSet == "en"){
                languageCompare = 0
            }else{
                languageCompare = 1
            }
            if(indexPath.row == languageCompare){
                cell.accessoryType = .checkmark
                checkedRow.append(indexPath)
            }
        }
        // Makes sure there is no selection style
        cell.selectionStyle = .none
    }
    // Set labels
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Sets the labels of each cell based on section with arrays listed at the top
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if(indexPath.section == 0){
          cell.textLabel?.text = locationSelection[indexPath.row]
        }else{
          cell.textLabel?.text = languageSelection[indexPath.row]
        }
        return cell
    }
}
