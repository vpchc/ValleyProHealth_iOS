//
//  BusTableViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 10/6/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class BusTableViewController: UITableViewController {
    
    // MARK: - Outlets -
    // MARK: Labels
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    //MARK: - View Lifecyle -
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: - TableSetup -
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    //MARK: -Display Bus Info-
    func setText(busText: [String]){
        /*
            Arguments: busText - Final bus info string to display
            Description: Displays the bus information on the screen
            Returns: Nothing
        */
        locationLabel.text = busText[0]
        hoursLabel.text    = busText[1]
        statusLabel.text   = busText[2]
    }
}
