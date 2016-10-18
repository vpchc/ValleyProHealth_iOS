//
//  ServicesViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/14/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class ServicesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var locationPicker: UIPickerView!
    @IBOutlet weak var servicesPicker: UIPickerView!
    
    let defaults = UserDefaults.standard
   
    let locations = [
        NSLocalizedString("Select a Location", comment: "Services Location Directions"),
        "Bloomingdale", "Cayuga", "Clinton", "Crawfordsville", "Terre Haute"]
    let services = [
        NSLocalizedString("Select a Services Category", comment: "Services Service Directions"),
        NSLocalizedString("Behavioral Health", comment: "Services Service Selection"),
        NSLocalizedString("Dental", comment: "Services Service Selection"),
        NSLocalizedString("Patient Support", comment: "Services Service Selection"),
        NSLocalizedString("Primary Care", comment: "Services Service Selection")]
    var dataToSegue = ["", "", "" , ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.locationPicker.delegate = self
        self.locationPicker.dataSource = self
        self.servicesPicker.delegate = self
        self.servicesPicker.dataSource = self
        
        //Set the default locationPicker value based on the location Preference
        //If the location preference is msbhc, it is set to no preference since there isn't information for the msbhc.
        let savedLocation = defaults.object(forKey:"locationPreference") as! Int
        if(savedLocation == 0 || savedLocation == 6){
            locationPicker.selectRow(0, inComponent: 0, animated: false)
        }else{
            locationPicker.selectRow(savedLocation, inComponent: 0, animated: false)
            servicesPicker.isHidden = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
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
            return services.count
        }
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if( pickerView == locationPicker){
            return locations[row]
        }else{
            return services[row]
            
        }
    }
    
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
    
    // When a selection is made by the user
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(pickerView == locationPicker){
            if(row != 0){
                servicesPicker.isHidden = false;
                dataToSegue[0] = locations[row]
                dataToSegue[2] = String(row)
            }else{
                servicesPicker.isHidden = true;
            }
        }else{
            if(row != 0){
                dataToSegue[1] = services[row]
                dataToSegue[3] = String(row)
                servicesPicker.selectRow(0, inComponent: 0, animated: false)
                self.performSegue(withIdentifier: "ServicesDataSegue", sender: self)
            }
            
        }
    }
    

}
