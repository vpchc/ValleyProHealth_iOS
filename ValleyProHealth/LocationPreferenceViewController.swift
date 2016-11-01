//
//  LocationPreferenceViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/29/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class LocationPreferenceViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
   
    // MARK: - Outlets -
    //MARK: Arrays
    let locationsList =
            [NSLocalizedString("Select a preferred location", comment: "Locations Preference Selection Directions"),
            NSLocalizedString("No Preference", comment: "Locations Preference Selection"), "Bloomingdale", "Cayuga", "Clinton", "Crawfordsville", "Terre Haute", "MSBHC"]
    //MARK: Defaults
    let defaults = UserDefaults.standard
    // MARK: Pickers
    @IBOutlet weak var locationsPicker: UIPickerView!
    
    //MARK: - View Lifecyle -
    override func viewDidLoad() {
        super.viewDidLoad()

        // Connect data
        self.locationsPicker.delegate = self
        self.locationsPicker.dataSource = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: - Picker Setup -
    // Number of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // Number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locationsList.count
    }
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locationsList[row]
    }
    // Row selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        //Sets the location preference and then dismisses
        if (row != 0){
            defaults.set(row - 1, forKey: "locationPreference")
            self.dismiss(animated: true, completion: nil)
        }
    }
}
