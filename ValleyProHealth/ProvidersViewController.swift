//
//  ProvidersViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/13/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class ProvidersViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var locationPicker: UIPickerView!
    @IBOutlet weak var providerTypePicker: UIPickerView!
    
    let defaults = UserDefaults.standard
    
    var locations = [
        NSLocalizedString("Select a Location", comment: "Providers Locations Directions"),
        "Bloomingdale", "Cayuga", "Clinton", "Crawfordsville", "Terre Haute", "MSBHC"]
    var providerTypes1 = [
        NSLocalizedString("Select a Type of Provider", comment: "Providers Provider Directions"),
        NSLocalizedString("Behavioral Health", comment: "Providers Provider Selection"),
        NSLocalizedString("Dental", comment: "Providers Provider Selection"),
        NSLocalizedString("Medical", comment: "Providers Provider Selection")]
    //This is for Clinton, Crawfordsville, Terre Haute and the MSBHC which don't currently have dental
    var providerTypes2 = [
        NSLocalizedString("Select a Type of Provider", comment: "Provider Provider Directions"),
        NSLocalizedString("Behavioral Health", comment: "Provider Provider Selection"),
        NSLocalizedString("Medical", comment: "Provider Provider Selection")]
    
    var finalProviderTypes = [String]()
    var dataToSegue = ["", "", "" , ""]
    
    var locationIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.locationPicker.delegate = self
        self.locationPicker.dataSource = self
        self.providerTypePicker.delegate = self
        self.providerTypePicker.dataSource = self
        
        //Set the default locationPicker value based on the location Preference
        let savedLocation = defaults.object(forKey:"locationPreference") as! Int
        print(savedLocation)
        locationPicker.selectRow(savedLocation, inComponent: 0, animated: false)
        if(savedLocation == 0 || savedLocation == 2){
            resetProviderPicker(row: 0)
        }else if(savedLocation == 1 || savedLocation > 2){
            resetProviderPicker(row: savedLocation)
            dataSegueSetup(row: savedLocation, pickerIndex: 0)
        }
    }

    //When the user taps the back button
    @IBAction func backButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
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
        if( pickerView == locationPicker){
            return locations.count
        }else{
            if(locationIndex == 1 || locationIndex == 2){
                finalProviderTypes = providerTypes1
            }else{
                finalProviderTypes = providerTypes2
            }
            return finalProviderTypes.count
        }
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == locationPicker){
            return locations[row]
        }else{
            return finalProviderTypes[row]
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProvidersDataSegue" {
            if let destination = segue.destination as? ProvidersFormViewController{
                destination.dataSegue[0] = (dataToSegue[0])
                destination.dataSegue[1] = (dataToSegue[1])
                destination.dataSegue[2] = (dataToSegue[2])
                destination.dataSegue[3] = (dataToSegue[3])
            }
        }
    }
    
    func resetProviderPicker(row: Int){
        locationIndex = row
        self.providerTypePicker.reloadAllComponents()
        if(row != 0 || row != 3){
            providerTypePicker.isHidden = false;
        }
    }
    
    func dataSegueSetup(row: Int, pickerIndex: Int){
        if(pickerIndex == 0){
            dataToSegue[0] = locations[row]
            dataToSegue[2] = String(row)
        }else{
            dataToSegue[1] = finalProviderTypes[row]
            dataToSegue[3] = String(row)
        }
    }
    // When a selection is made by the user
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(pickerView == locationPicker){
            if(row != 0){
                resetProviderPicker(row: row)
                dataSegueSetup(row: row, pickerIndex: 0)
            }else{
                providerTypePicker.isHidden = true;
            }
        }else{
            if(row != 0){
                dataSegueSetup(row: row, pickerIndex: 1)
                providerTypePicker.selectRow(0, inComponent: 0, animated: false)
                self.performSegue(withIdentifier: "ProvidersDataSegue", sender: self)
            }
        }
    }

}
