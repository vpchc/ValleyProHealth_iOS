//
//  LocationsViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/14/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit
import MapKit

class LocationsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //MARK: Buttons
    @IBOutlet weak var backButton: UIButton!
    //MARK: Pickers
    @IBOutlet weak var locationPicker: UIPickerView!
    @IBOutlet weak var optionPicker: UIPickerView!
    //MARK: Defaults
    let defaults = UserDefaults.standard
    //MARK: Arrays
    var dataToSegue = ["", "", "", ""]
    let directionsLat = ["39.830453", "39.940612", "39.653585", "40.049819", "39.484390"]
    let directionsLong = ["-87.254084", "-87.469077", "-87.399138", "-86.907426", "-87.407648"]
    var locations = [
        NSLocalizedString("Select a Location", comment: "Locations Location Directions"), "Bloomingdale", "Cayuga", "Clinton", "Crawfordsville", "Terre Haute"]
    var options = [
        NSLocalizedString("Select an option", comment: "Locations Options Directions"),
        NSLocalizedString("Clinic Hours", comment: "Locations Options Selection"),
        NSLocalizedString("Contact Info", comment: "Locations Options Selection"),
        NSLocalizedString("Get Directions", comment: "Locations Options Selection")]
    //MARK: String
    var locationIndex = 0

    //MARK: View Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup Pickers
        self.locationPicker.delegate = self
        self.locationPicker.dataSource = self
        self.optionPicker.delegate = self
        self.optionPicker.dataSource = self
        
        //Set the default locationPicker value based on the location Preference.
        //If the location preference is msbhc, it is set to no preference since there isn't information for the msbhc.
        let savedLocation = defaults.object(forKey:"locationPreference") as! Int
        if(savedLocation == 0 || savedLocation == 6){
            locationPicker.selectRow(0, inComponent: 0, animated: false)
        }else{
            locationPicker.selectRow(savedLocation, inComponent: 0, animated: false)
            locationDataSegueSetup(row: savedLocation)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Decision Buttons
    @IBAction func backButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: Picker Setup
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if( pickerView == locationPicker){
            return locations.count
        }else{
            return options.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if( pickerView == locationPicker){
            return locations[row]
        }else{
            return options[row]
            
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(pickerView == locationPicker){
            print("row: " + String(row))
            if(row != 0){
                locationDataSegueSetup(row: row)
            }else{
                optionPicker.isHidden = true;
            }
        }else if(pickerView == optionPicker && row != 0){
            //Resets the Picker after a selection is made
            optionPicker.selectRow(0, inComponent: 0, animated: false)
            
            if(row == 1){//Clinic Hours Selection
                if(locationIndex == 3){
                    self.performSegue(withIdentifier: "ClinicHoursDataSegue2", sender: self)
                }else{
                    print("0: " + dataToSegue[0])
                    print("1: " + dataToSegue[1])
                    self.performSegue(withIdentifier: "ClinicHoursDataSegue1", sender: self)
                }
            }else if(row == 2){//Contact Info Selection
                self.performSegue(withIdentifier: "ContactInfoDataSegue", sender: self)
            }else{//Directions Selection
                //Convert from string to NSString
                let latConvert : NSString = directionsLat[locationIndex - 1] as NSString
                let longConvert : NSString = directionsLong[locationIndex - 1] as NSString
                
                //Convert to usable CLLocationDegrees
                let latitude : CLLocationDegrees  =  latConvert.doubleValue
                let longitude : CLLocationDegrees =  longConvert.doubleValue
                let regionDistance: CLLocationDistance = 10000
                
                //Define coordinates and regionspan
                let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
                let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
                
                //Set placemark
                let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
                let mapItem = MKMapItem(placemark: placemark)
                
                //Setup Map Options
                let options = [
                    MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                    MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
                ]
                
                //Set name of location and open map
                mapItem.name = "VPCHC " + dataToSegue[0] + " Site"
                mapItem.openInMaps(launchOptions: options)
            }
        }
    }
    //MARK: Segue Setup
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ClinicHoursDataSegue1" || segue.identifier == "ClinicHoursDataSegue2"{
            if let destination = segue.destination as? ClinicHoursFormViewController{
                destination.dataSegue[0] = (dataToSegue[0])
                destination.dataSegue[1] = (dataToSegue[1])
            }
        }else{
            if let destination = segue.destination as? ContactInfoFormViewController{
                destination.dataSegue[0] = (dataToSegue[0])
                destination.dataSegue[1] = (dataToSegue[1])
            }
        }
        
    }
    func locationDataSegueSetup(row: Int){
        optionPicker.isHidden = false;
        //Get chosen location ready to send in segue
        dataToSegue[0] = locations[row]
        dataToSegue[1] = String(row)
        //Index used to grab longitude and latitude for corresponding location from list.
        locationIndex = row
    }

}
