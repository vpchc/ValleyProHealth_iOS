//
//  LocationsViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/14/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class LocationsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var locationPicker: UIPickerView!
    @IBOutlet weak var optionPicker: UIPickerView!
    
    var locations = [String]()
    var options = [String]()
    var dataToSegue = ["", "", "" , ""]
    let bloomdirect = "201 W. Academy St.Bloomingdale, IN 47832"
    let caydirect = "703 W. Park Street Cayuga, IN 47928"
    let clintdirect = "777 S. Main Street, Suite 100 Clinton, IN 47842"
    let crawdirect = "1810 Lafayette Rd Crawfordsville, IN 47933"
    let terredirect = "1530 N 7th Street, Suite 201 Terre Haute, IN 47807"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.locationPicker.delegate = self
        self.locationPicker.dataSource = self
        self.optionPicker.delegate = self
        self.optionPicker.dataSource = self
        
        locations = ["Select a Location", "Bloomingdale", "Cayuga", "Clinton", "Crawfordsville", "Terre Haute"]
        options = ["Select an option", "Clinic Hours", "Contact Info", "Get Direction"]

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
            return options.count
        }
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if( pickerView == locationPicker){
            return locations[row]
        }else{
            return options[row]
            
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
            optionPicker.hidden = false;
            dataToSegue[0] = locations[row]
            dataToSegue[1] = String(row)
        }else if (pickerView == locationPicker && row == 0){
            optionPicker.hidden = true;
        }
        
        if( pickerView == optionPicker && row != 0){
            optionPicker.selectRow(0, inComponent: 0, animated: true)
            if(row == 1){
              self.performSegueWithIdentifier("ClinicHoursDataSegue", sender: self)
            }else if(row == 2){
                self.performSegueWithIdentifier("ContacInfoDataSegue", sender: self)
            }else{
                var directionsURL = String()
                if(dataToSegue[1] == "1"){
                    directionsURL = bloomdirect
                }else if(dataToSegue[1] == "2"){
                    directionsURL = caydirect
                }else if(dataToSegue[1] == "3"){
                    directionsURL = clintdirect
                }else if(dataToSegue[1] == "4"){
                    directionsURL = crawdirect
                }else if(dataToSegue[1] == "5"){
                    directionsURL = terredirect
                }
                UIApplication.sharedApplication().openURL(NSURL(fileURLWithPath: "http://maps.apple.com/?address=" + directionsURL))
            }
            
            
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
