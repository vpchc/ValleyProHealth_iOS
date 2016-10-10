//
//  OptionsTablesViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 10/10/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class OptionsTablesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    let numberOfRows = [7,2]
    
    let cellIdentifier = "OptionCells"
    
    @IBOutlet weak var optionsTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        optionsTable.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        optionsTable.delegate = self
        optionsTable.dataSource = self
        
        //self.clearsSelectionOnViewWillAppear = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.optionsTable.dequeueReusableCell(withIdentifier: cellIdentifier) as UITableViewCell!
        
        // set the text from the data model
        //cell.textLabel?.text = self.animals[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rows = 0
        
        if(section < numberOfRows.count){
            rows = numberOfRows[section]
        }
        
        return rows
        
    }
    /*
     func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
     let cell = optionsTable.cellForRow(at: indexPath as IndexPath)
     print("Should be checked")
     cell?.accessoryType = .checkmark
     
     }
     
     */
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }

}
