//
//  ProvidersViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/13/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class ProvidersViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Outlets -
    // MARK: Buttons
    @IBOutlet weak var backButton: UIButton!
    // MARK: Pickers
    @IBOutlet weak var locationPicker: UIPickerView!
    @IBOutlet weak var providerTypePicker: UIPickerView!
    @IBOutlet weak var providerListPicker: UIPickerView!
    
    // MARK: - Global Variables -
    // MARK: Arrays
    var dataToSegue = ["", ""]
    var finalProviderTypes = [String]()
    var providerList = [String]()
    var locations = [
        NSLocalizedString("Select a location", comment: "Providers Locations Directions"),
        "Bloomingdale", "Cayuga", "Clinton", "Crawfordsville", "Rockville", "Terre Haute", "MSBHC"]
    var providerTypes1 = [
        NSLocalizedString("Select a type of provider", comment: "Providers Provider Directions"),
        NSLocalizedString("Behavioral Health", comment: "Providers Provider Selection"),
        NSLocalizedString("Dental", comment: "Providers Provider Selection"),
        NSLocalizedString("Primary Care", comment: "Providers Provider Selection")]
    var providerTypes2 = [
        NSLocalizedString("Select a type of provider", comment: "Provider Provider Directions"),
        NSLocalizedString("Behavioral Health", comment: "Provider Provider Selection"),
        NSLocalizedString("Primary Care", comment: "Provider Provider Selection")]
    var providerTypes3 = [
        NSLocalizedString("Select a type of provider", comment: "Provider Provider Directions"),
        NSLocalizedString("Primary Care", comment: "Provider Provider Selection")]
    var dataSegue = ["","","",""]
    var providers_dental_bloomingdale = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Dr. Dane Mishler, DDS"]
    var providers_bh_bloomingdale = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Dr. Paul Taraska, MD", "Zac Milam, LMHC", "Megan Neitling, LMHCA"]
    var providers_medical_bloomingdale = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Dr. Christopher Fitzsimmons, MD", "Christi Busenbark, FNP-C", "Louwanna Wallace, FNP-C"]
    var providers_dental_cayuga = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Dr. Nichole Barnett, DDS"]
    var providers_bh_cayuga = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Dr. Paul Taraska, MD", "Johnathan Detwiler, MS", "Tasha Stevens, LCSW, RN", "Lisa Tincher, PMHNP"]
    var providers_medical_cayuga = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Dr. Danielle Cundiff, DO", "Dr. Bing Gale, MD", "Renae Norman, FNP-C"]
    var providers_dental_clinton = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Currently none at this location"]
    var providers_bh_clinton = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Dr. Paul Taraska, MD", "Dr. Julia Wernz, PhD, HSPP", "Gary Anderson, MS", "Linda Lonneman, LCSW", "David McIntyre, LCAC", "Zac Milam, LMHC", "Lisa Tincher, PMHNP"]
    var providers_medical_clinton = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Dr. Aziz Abed, MD, MPH", "Dr. Danielle Cundiff, DO", "Dr. Bing Gale, MD", "Gretchen Blevins, FNP-C", "Nicole Hall, FNP-C", "Brandi Larson, FNP-C", "Tammy Mundy, FNP-C"]
    var providers_dental_crawfordsville = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Currently none at this location"]
    var providers_bh_crawfordsville = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Dr. Paul Taraska, MD", "Misha Bennett, LCSW", "Keith Seegers, LCSW", "Dana Tinkle, LMHC, RPT"]
    var providers_medical_crawfordsville = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Dr. Danielle Cundiff, DO", "Dr. Christopher Fitzsimmons, MD", "Dr. Patrick Foley, MD", "Jessica Bekkering, FNP-C", "Brandi Larson, FNP-C"]
    var providers_dental_rockville = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Currently none at this location"]
    var providers_bh_rockville = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Currently none at this location"]
    var providers_medical_rockville = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Dr. Christopher Fitzsimmons, MD", "Dr. Steven Waltz, MD", "Brandie Ruark, FNP-C", "Jordan Ryley, FNP-C"]
    var providers_dental_terrehaute = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Currently none at this location"]
    var providers_bh_terrehaute = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Sara Ritter, LCSW", "Lacey Skwortz, LCSW", "Lisa Tincher, PMHNP"]
    var providers_medical_terrehaute = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Leslie Batty, FNP-C", "Beth Fields, FNP-C", "Tammy Pearson, FNP-C", "Residents"]
    var providers_dental_msbhc = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Currently none at this location"]
    var providers_bh_msbhc = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Heather Woods, LMHCA"]
    var providers_medical_msbhc = [NSLocalizedString("Select a provider", comment: "Provider Selection"), "Nicole Cook, FNP-C", "Renae Norman, FNP-C"]
    // MARK: Defaults
    let defaults = UserDefaults.standard
    // MARK: Ints
    var locationIndex = 0
    var typeIndex = 0
    var medOnlyCheck = false
    var dentalCheck = false
    
    // MARK: - View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data to pickers:
        self.locationPicker.delegate = self
        self.locationPicker.dataSource = self
        self.providerTypePicker.delegate = self
        self.providerTypePicker.dataSource = self
        self.providerListPicker.delegate = self
        self.providerListPicker.dataSource = self
        
        //Set the default locationPicker value based on the location Preference
        let savedLocation = defaults.object(forKey:"locationPreference") as! Int
        if(savedLocation == 0){
            locationPicker.selectRow(0, inComponent: 0, animated: false)
        }else{
            locationPicker.selectRow(savedLocation, inComponent: 0, animated: false)
            resetProviderPicker(row: savedLocation, selection: 0)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        if(pickerView == locationPicker){
            return locations.count
        }else if(pickerView == providerTypePicker){
            if(locationIndex == 2){//Cayuga
                finalProviderTypes = providerTypes1
                dentalCheck = true
                medOnlyCheck = false
            }else if(locationIndex == 5){//Rockville
                finalProviderTypes = providerTypes3
                dentalCheck = false
                medOnlyCheck = true
            }else{
                dentalCheck = false
                medOnlyCheck = false
                finalProviderTypes = providerTypes2
            }
            return finalProviderTypes.count
        }else{
            if(typeIndex == 1){
                if(medOnlyCheck){
                    providerList = providers_medical_rockville
                }else{
                    if(locationIndex == 1){
                        providerList = providers_bh_bloomingdale
                    }else if(locationIndex == 2){
                        providerList = providers_bh_cayuga
                    }else if(locationIndex == 3){
                        providerList = providers_bh_clinton
                    }else if(locationIndex == 4){
                        providerList = providers_bh_crawfordsville
                    }else if(locationIndex == 6){
                        providerList = providers_bh_terrehaute
                    }else{
                        providerList = providers_bh_msbhc
                    }
                }
            }else if(typeIndex == 2){
                if(dentalCheck){
                    providerList = providers_dental_cayuga
                }else{
                    if(locationIndex == 1){
                        providerList = providers_medical_bloomingdale
                    }else if(locationIndex == 3){
                        providerList = providers_medical_clinton
                    }else if(locationIndex == 4){
                        providerList = providers_medical_crawfordsville
                    }else if(locationIndex == 5){
                        providerList = providers_medical_rockville
                    }else if(locationIndex == 6){
                        providerList = providers_medical_terrehaute
                    }else{
                        providerList = providers_medical_msbhc
                    }
                }
            }else{
                 providerList = providers_medical_cayuga
            }
            return providerList.count
        }
    }
    
    // Row data
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == locationPicker){
            return locations[row]
        }else if(pickerView == providerTypePicker){
            return finalProviderTypes[row]
        }else{
            return providerList[row]
        }
    }
    // Row selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(pickerView == locationPicker){
            if(row != 0){
                resetProviderPicker(row: row, selection: 0)
            }else{
                providerTypePicker.isHidden = true;
            }
            providerListPicker.selectRow(0, inComponent: 0, animated: false)
            providerListPicker.isHidden = true;
        }else if(pickerView == providerTypePicker){
            if(row != 0){
                resetProviderPicker(row: row, selection: 1)
                dataSegueSetup(row: row, pickerSelection: 0)
            }else{
                providerListPicker.isHidden = true;
            }
        }else{
            if(row != 0){
                //If the residents are selected, open the "Our Residents" page on FP residency website
                if(locationIndex == 6 && (dataToSegue[0] == "Primary Care" || dataToSegue[0] == "Atención primaria") && row == 4){
                    let residentsUrl = URL(string: "http://www.uhfmr.org/index.php/about-us/45")!
                    if #available(iOS 10.0, *) {
                        UIApplication.shared.open(residentsUrl, options: [:], completionHandler: nil)
                    } else {
                        UIApplication.shared.openURL(residentsUrl)
                    }
                }
                else{
                    dataSegueSetup(row: row, pickerSelection: 1)
                    providerListPicker.selectRow(0, inComponent: 0, animated: false)
                    self.performSegue(withIdentifier: "ProvidersDataSegue", sender: self)
                }
            }
        }
    }
    func resetProviderPicker(row: Int, selection: Int){
    /*
         Arguments:   row - Integer that is the row selected by the user,
                      selection - 0: Type Picker 1: List Picker
         Description: Resets the provider picker based on selection.
         Returns:     Nothing
    */
        if(selection == 0){
            locationIndex = row
            self.providerTypePicker.reloadAllComponents()
            providerTypePicker.selectRow(0, inComponent: 0, animated: false)
            providerTypePicker.isHidden = false;
        }else{
            typeIndex = row
            self.providerListPicker.reloadAllComponents()
            providerListPicker.selectRow(0, inComponent: 0, animated: false)
            providerListPicker.isHidden = false;
        }
    }
    
    // MARK: - Segue Setup -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ProvidersDataSegue" {
            if let destination = segue.destination as? ProvidersFormViewController{
                destination.dataSegue[0] = (dataToSegue[0])
                destination.dataSegue[1] = (dataToSegue[1])
            }
        }
    }
    func dataSegueSetup(row: Int, pickerSelection: Int){
    /*
         Arguments:   row - Integer that is the row selected by the user, pickerIndex - Integer of the picker storing data
         Description: Setup the data to send via Segue.
         Returns:     Nothing
    */
        if(pickerSelection == 0){
            print(finalProviderTypes)
            print(row)
            dataToSegue[0] = finalProviderTypes[row]
                    }else{
            dataToSegue[1] = providerList[row]
        }
    }
}
