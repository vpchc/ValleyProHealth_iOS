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
   
    var locations = [String]()
    var services = [String]()
    var dataToSegue = ["", "", "" , ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.locationPicker.delegate = self
        self.locationPicker.dataSource = self
        self.servicesPicker.delegate = self
        self.servicesPicker.dataSource = self
        
        locations = ["Select a Location", "Bloomingdale", "Cayuga", "Clinton", "Crawfordsville", "Terre Haute"]
        services = ["Select a Services Category", "Behavioral Health", "Dental", "Patient Support", "Primary Care"]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonTap(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
            return services.count
        }
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if( pickerView == locationPicker){
            return locations[row]
        }else{
            return services[row]
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ServicesDataSegue" {
            if let destination = segue.destinationViewController as? ServicesFormViewController{
                destination.dataSegue[0] = (dataToSegue[0])
                destination.dataSegue[1] = (dataToSegue[1])
                destination.dataSegue[2] = (dataToSegue[2])
                destination.dataSegue[3] = (dataToSegue[3])
            }
        }
    }
    
    // When a selection is made by the user
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(pickerView == locationPicker){
            if(row != 0){
                servicesPicker.hidden = false;
                dataToSegue[0] = locations[row]
                dataToSegue[2] = String(row)
            }else{
                servicesPicker.hidden = true;
            }
        }else{
            if(row != 0){
                dataToSegue[1] = services[row]
                dataToSegue[3] = String(row)
                servicesPicker.selectRow(0, inComponent: 0, animated: false)
                self.performSegueWithIdentifier("ServicesDataSegue", sender: self)
            }
            
        }
    }
    

}
