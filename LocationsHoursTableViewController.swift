//
//  LocationsHoursTableViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 10/20/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class LocationsHoursTableViewController: UITableViewController {

    // MARK: - Outlets -
    // MARK: Labels
    @IBOutlet weak var mondayHoursLabel: UILabel!
    @IBOutlet weak var tuesdayHoursLabel: UILabel!
    @IBOutlet weak var wednesdayHoursLabel: UILabel!
    @IBOutlet weak var thursdayHoursLabel: UILabel!
    @IBOutlet weak var fridayHoursLabel: UILabel!
    
    // MARK: - View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table Setup -
    func setTableText(hours: [String]){
        mondayHoursLabel.text    = hours[0]
        tuesdayHoursLabel.text   = hours[1]
        wednesdayHoursLabel.text = hours[2]
        thursdayHoursLabel.text  = hours[3]
        fridayHoursLabel.text    = hours[4]
    }
    // Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // Number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}
