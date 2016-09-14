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
    
    var locations = [String]()
    var providerTypes = [String]()
    var dataToSegue = ["", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.locationPicker.delegate = self
        self.locationPicker.dataSource = self
        self.providerTypePicker.delegate = self
        self.providerTypePicker.dataSource = self
        
        locations = ["Select a Location", "Bloomingdale", "Cayuga", "Clinton", "Crawfordsville", "Terre Haute", "MSBHC"]
        providerTypes = ["Select a Type of Provider", "Dental", "Behavioral Health", "Medical"]
    }

    //When the user taps the back button
    @IBAction func backButtonTap(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // The number of columns of data
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if( pickerView == locationPicker){
            return locations.count
        }else{
            return providerTypes.count
        }
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if( pickerView == locationPicker){
            return locations[row]
        }else{
            return providerTypes[row]

        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ProvidersDataSegue" {
            if let destination = segue.destinationViewController as? ProvidersFormViewController{
                destination.dataSegue[0] = (dataToSegue[0])
                destination.dataSegue[1] = (dataToSegue[1])
            }
        }
    }
    
    // When a selection is made by the user
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if( pickerView == locationPicker && row != 0){
            providerTypePicker.hidden = false;
            dataToSegue[0] = locations[row]
        }else if (pickerView == locationPicker && row == 0){
            providerTypePicker.hidden = true;
        }
        
        if( pickerView == providerTypePicker && row != 0){
            dataToSegue[1] = providerTypes[row]
            self.performSegueWithIdentifier("ProvidersDataSegue", sender: self)
        }
    }

}
