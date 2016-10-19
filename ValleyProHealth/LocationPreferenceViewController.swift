//
//  LocationPreferenceViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/29/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class LocationPreferenceViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
   
    //MARK: Pickers
    @IBOutlet weak var locationsPicker: UIPickerView!
    
    //MARK: Arrays
    var locationsList = [String]()
    //MARK: Defaults
    let defaults = UserDefaults.standard
    
    //MARK: View Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()

        //Setup Location Picker
        self.locationsPicker.delegate = self
        self.locationsPicker.dataSource = self
        locationsList = [
            NSLocalizedString("Select a preferred location", comment: "Locations Preference Selection Directions"),
            NSLocalizedString("No Preference", comment: "Locations Preference Selection"), "Bloomingdale", "Cayuga", "Clinton", "Crawfordsville", "Terre Haute", "MSBHC"]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //MARK: Picker Setup
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locationsList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locationsList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        //Sets the location preference and then dismisses
        if (row != 0){
            defaults.set(row - 1, forKey: "locationPreference")
            self.dismiss(animated: true, completion: nil)
        }
    }
}
