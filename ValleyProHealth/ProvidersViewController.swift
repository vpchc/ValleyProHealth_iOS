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
    
    var locations = [String]()
    var providerTypes1 = [String]()
    var providerTypes2 = [String]()
    var finalProviderTypes = [String]()
    var dataToSegue = ["", "", "" , ""]
    
    var locationSelection = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let locationSet = defaults.object(forKey:"locationPreference")
        providerTypePicker.selectRow(locationSet as! Int, inComponent: 0, animated: false)
        
        // Connect data:
        self.locationPicker.delegate = self
        self.locationPicker.dataSource = self
        self.providerTypePicker.delegate = self
        self.providerTypePicker.dataSource = self
        
        locations = ["Select a Location", "Bloomingdale", "Cayuga", "Clinton", "Crawfordsville", "Terre Haute", "MSBHC"]
        providerTypes1 = ["Select a Type of Provider", "Behavioral Health", "Dental", "Medical"]
        //This is for Clinton, Crawfordsville, Terre Haute and the MSBHC which don't currently have dental
        providerTypes2 = ["Select a Type of Provider", "Behavioral Health", "Medical"]
        

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
            if(locationSelection == 1 || locationSelection == 2){
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
    
    // When a selection is made by the user
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(pickerView == locationPicker){
            if(row != 0){
                locationSelection = row
                self.providerTypePicker.reloadAllComponents()
                providerTypePicker.isHidden = false;
                dataToSegue[0] = locations[row]
                dataToSegue[2] = String(row)
            }else{
                providerTypePicker.isHidden = true;
            }
        }else{
            if(row != 0){
                dataToSegue[1] = finalProviderTypes[row]
                dataToSegue[3] = String(row)
                providerTypePicker.selectRow(0, inComponent: 0, animated: false)
                self.performSegue(withIdentifier: "ProvidersDataSegue", sender: self)
            }
        }
    }

}
