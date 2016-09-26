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

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var locationPicker: UIPickerView!
    @IBOutlet weak var optionPicker: UIPickerView!
    
    var locations = [String]()
    var options = [String]()
    var locationIndex = 0
    var dataToSegue = ["", "", "" , ""]
    let directionsLat = ["39.830453", "39.940612", "39.653585", "40.049819", "39.484390"]
    let directionsLong = ["-87.254084", "-87.469077", "-87.399138", "-86.907426", "-87.407648"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.locationPicker.delegate = self
        self.locationPicker.dataSource = self
        self.optionPicker.delegate = self
        self.optionPicker.dataSource = self
        
        locations = ["Select a Location", "Bloomingdale", "Cayuga", "Clinton", "Crawfordsville", "Terre Haute"]
        options = ["Select an option", "Clinic Hours", "Contact Info", "Get Directions"]

        // Do any additional setup after loading the view.
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
            return options.count
        }
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if( pickerView == locationPicker){
            return locations[row]
        }else{
            return options[row]
            
        }
    }
    
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
    
    // When a selection is made by the user
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(pickerView == locationPicker){
            if(row != 0){
                optionPicker.isHidden = false;
                dataToSegue[0] = locations[row]
                dataToSegue[1] = String(row)
                locationIndex = row - 1
            }else{
                optionPicker.isHidden = true;
            }
        }else if(pickerView == optionPicker && row != 0){
            optionPicker.selectRow(0, inComponent: 0, animated: false)
            if(row == 1){
                if(dataToSegue[1] == "3"){
                    self.performSegue(withIdentifier: "ClinicHoursDataSegue2", sender: self)
                }else{
                    self.performSegue(withIdentifier: "ClinicHoursDataSegue1", sender: self)
                }
            }else if(row == 2){
                self.performSegue(withIdentifier: "ContactInfoDataSegue", sender: self)
            }else{
                let latConvert : NSString = directionsLat[locationIndex] as NSString
                let longConvert : NSString = directionsLong[locationIndex] as NSString
                
                let latitude : CLLocationDegrees =  latConvert.doubleValue
                let longitude : CLLocationDegrees =  longConvert.doubleValue
                let regionDistance:CLLocationDistance = 10000
                let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
                let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
                let options = [
                    MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                    MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
                ]
                let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
                let mapItem = MKMapItem(placemark: placemark)
                mapItem.name = "VPCHC " + dataToSegue[0] + " Site"
                mapItem.openInMaps(launchOptions: options)
       
            }
            
        }
    }

}
