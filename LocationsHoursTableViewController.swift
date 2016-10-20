//
//  LocationsHoursTableViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 10/20/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class LocationsHoursTableViewController: UITableViewController {

    @IBOutlet weak var mondayHoursLabel: UILabel!
    @IBOutlet weak var tuesdayHoursLabel: UILabel!
    @IBOutlet weak var wednesdayHoursLabel: UILabel!
    @IBOutlet weak var thursdayHoursLabel: UILabel!
    @IBOutlet weak var fridayHoursLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setTableText(hours: [String]){
        print(hours)
        mondayHoursLabel.text    = hours[0]
        tuesdayHoursLabel.text   = hours[1]
        wednesdayHoursLabel.text = hours[2]
        thursdayHoursLabel.text  = hours[3]
        fridayHoursLabel.text    = hours[4]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }
    
}
