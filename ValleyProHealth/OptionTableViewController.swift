//
//  OptionTableViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/30/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit
import Toast_Swift

class OptionTableViewController: UITableViewController {
    
    @IBOutlet var optionsTable: UITableView!
    
    let defaults = UserDefaults.standard
    
    let numberOfRows = [7,2]
    var checkedRow = [IndexPath]()
    var cellCount = 0
    
    let locationSelection = ["No Preference", "Bloomingdale", "Cayuga", "Clinton" , "Crawfordsville", "Terre Haute" , "MSBHC"]
    let languageSelection = ["English", "Spanish"]
    
    let cellIdentifier = "OptionCells"
    
    let previousIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionsTable.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that con be recreated.
    }
    
    func saveChanges(){
        let savedlocation = defaults.object(forKey:"locationPreference") as! Int
        if(savedlocation != checkedRow[0].row){
            defaults.set(checkedRow[0].row, forKey: "locationPreference")
            self.dismiss(animated: true, completion: nil)
        }else{
            self.view.makeToast("No changes to save")
        }
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
        
        if (indexPath.section == 0){
          if (indexPath != checkedRow[0]){
            let previousCell = tableView.cellForRow(at: checkedRow[0])
            let currentCell = tableView.cellForRow(at: indexPath)
            previousCell?.accessoryType = .none
            currentCell?.accessoryType = .checkmark
            //Set newly checked cell to compare
            checkedRow[0] = indexPath
          }
        }else{
            if (indexPath != checkedRow[1]){
              let previousCell = tableView.cellForRow(at: checkedRow[1])
              let currentCell = tableView.cellForRow(at: indexPath)
              previousCell?.accessoryType = .none
              currentCell?.accessoryType = .checkmark
              //Set newly checked cell to compare
              checkedRow[1] = indexPath
            }
        }

    }
 
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if(indexPath.section == 0){
          let locationSet = defaults.object(forKey:"locationPreference") as! Int
            if(indexPath.row == locationSet){
                cell.accessoryType = .checkmark
                checkedRow.append(indexPath)
            }
        }else{
            if(indexPath.row == 0){
                cell.accessoryType = .checkmark
                checkedRow.append(indexPath)
            }
        }
        cell.selectionStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        if(indexPath.section == 0){
          cell.textLabel?.text = locationSelection[indexPath.row]
        }else{
          cell.textLabel?.text = languageSelection[indexPath.row]
        }
        return cell
    }
 
 
    
}
