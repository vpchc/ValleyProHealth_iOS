//
//  ServicesViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/14/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Outlets - 
    // MARK: Buttons
    @IBOutlet weak var backButton: UIButton!
    // MARK: Pickers
    @IBOutlet weak var locationPicker: UIPickerView!
    @IBOutlet weak var servicesPicker: UIPickerView!
    
    // MARK: - Global Variables -
    // MARK: Arrays
    var dataToSegue = ["", "", "" , ""]
    var finalServices = [String]()
    let locations = [
        NSLocalizedString("Select a location", comment: "Services Location Directions"),
        "Bloomingdale", "Cayuga", "Clinton", "Crawfordsville", "Rockville", "Terre Haute"]
    let services = [
        NSLocalizedString("Select a category", comment: "Services Service Directions"),
        NSLocalizedString("Behavioral Health", comment: "Services Service Selection"),
        NSLocalizedString("Dental", comment: "Services Service Selection"),
        NSLocalizedString("Patient Support", comment: "Services Service Selection"),
        NSLocalizedString("Primary Care", comment: "Services Service Selection")]
    let services2 = [
        NSLocalizedString("Select a category", comment: "Services Service Directions"),
        NSLocalizedString("Behavioral Health", comment: "Services Service Selection"),
        NSLocalizedString("Patient Support", comment: "Services Service Selection"),
        NSLocalizedString("Primary Care", comment: "Services Service Selection")]
    let services3 = [
        NSLocalizedString("Select a category", comment: "Services Service Directions"),
        NSLocalizedString("Primary Care", comment: "Services Service Selection")]
    // MARK: Defaults
    let defaults = UserDefaults.standard
    // MARK: Ints
    var locationIndex = 0
    
    // MARk: - View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data to pickers
        self.locationPicker.delegate = self
        self.locationPicker.dataSource = self
        self.servicesPicker.delegate = self
        self.servicesPicker.dataSource = self
        
        //Set the default locationPicker value based on the location Preference
        //If the location preference is msbhc, it is set to no preference since there isn't information for the msbhc.
        let savedLocation = defaults.object(forKey:"locationPreference") as! Int
        if(savedLocation == 0 || savedLocation == 7){
            locationPicker.selectRow(0, inComponent: 0, animated: false)
        }else{
            locationPicker.selectRow(savedLocation, inComponent: 0, animated: false)
            resetServicesPicker(row: savedLocation)
            dataSegueSetup(row: savedLocation, pickerIndex: 0)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation Buttons -
    @IBAction func backButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Picker Setup -
    // Number of columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // Number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if( pickerView == locationPicker){
            return locations.count
        }else{
            if(locationIndex == 2){//Cayuga
                finalServices = services
            }else if(locationIndex == 5){//Rockville
                finalServices = services3
            }else{
                finalServices = services2
            }
            return finalServices.count
        }
    }
    // Row data
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if( pickerView == locationPicker){
            return locations[row]
        }else{
            return finalServices[row]
            
        }
    }
    // When a selection is made by the user
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(pickerView == locationPicker){
            if(row != 0){
                resetServicesPicker(row: row)
                dataSegueSetup(row: row, pickerIndex: 0)
            }else{
                servicesPicker.isHidden = true;
            }
        }else{
            if(row != 0){
                servicesPicker.selectRow(0, inComponent: 0, animated: false)
                dataSegueSetup(row: row, pickerIndex: 1)
                self.performSegue(withIdentifier: "ServicesDataSegue", sender: self)
            }
        }
    }
    func resetServicesPicker(row: Int){
    /*
         Arguments: row - Integer that is the row selected by the user
         Description: Resets the services picker
         Returns: Nothing
    */
        locationIndex = row
        self.servicesPicker.reloadAllComponents()
        servicesPicker.isHidden = false;
    }

    // MARK: - Segue Setup -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ServicesDataSegue" {
            if let destination = segue.destination as? ServicesFormViewController{
                destination.dataSegue[0] = (dataToSegue[0])
                destination.dataSegue[1] = (dataToSegue[1])
                destination.dataSegue[2] = (dataToSegue[2])
                destination.dataSegue[3] = (dataToSegue[3])
            }
        }
    }
    func dataSegueSetup(row: Int, pickerIndex: Int){
        /*
         Arguments: row - Integer that is the row selected by the user, pickerIndex - Integer of the picker storing data
         Description: Resets the providerType picker
         Returns: Nothing
         */
        if(pickerIndex == 0){
            dataToSegue[0] = locations[row]
            dataToSegue[2] = String(row)
        }else{
            dataToSegue[1] = finalServices[row]
            dataToSegue[3] = String(row)
        }
    }
    

}
