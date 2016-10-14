//
//  LocationPreferenceViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/29/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class LocationPreferenceViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var locationsPicker: UIPickerView!
    
    let defaults = UserDefaults.standard
    
    var locationsList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Connect data:
        self.locationsPicker.delegate = self
        self.locationsPicker.dataSource = self
        
        locationsList = ["Select a preferred location", "No Preference", "Bloomingdale", "Cayuga", "Clinton", "Crawfordsville", "Terre Haute", "MSBHC"]
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // The number of columns of data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locationsList.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locationsList[row]
    }
    
    // When a selection is made by the user
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if( row != 0){
            defaults.set(row - 1, forKey: "locationPreference")
            self.dismiss(animated: true, completion: nil)
        }
    }
}
