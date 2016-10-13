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
    
    let numberOfRows = [7,2]
    
    let cellIdentifier = "OptionCells"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionsTable.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var rows = 0
        
        if(section < numberOfRows.count){
            rows = numberOfRows[section]
        }
        
        return rows
    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("yo")
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        //cell.selectionStyle = .none
        //cell.accessoryType = .checkmark
    }
    /*
   func tableView(tableView: UITableView, didSelectRowAt indexPath: NSIndexPath){
        print("You selected cell #\(indexPath.row)!")
        
    }
    */
   
}
