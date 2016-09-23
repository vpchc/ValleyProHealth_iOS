//
//  FormsViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/14/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class FormsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var locationPicker: UIPickerView!
    @IBOutlet weak var categoriesPicker: UIPickerView!
    @IBOutlet weak var formPicker: UIPickerView!
    
    var locations = [String]()
    var categories = [String]()
    var forms = [String]()
    
    var consentForms = [String]()
    var newpatForms = [String]()
    var noticeForms = [String]()
    var slidingForms = [String]()
    var studentForms = [String]()
    var finalForms = [String]()
    
    var finalFiles = [String]()
    var consentFiles = [String]()
    var newpatFiles = [String]()
    var noticeFiles = [String]()
    var recordFiles = [String]()
    var slidingFiles = [String]()
    var studentFiles = [String]()
    
    var websiteUrlCombine = String()
    
    var locationSelection = 0
    var categorySelection = 0
    
    let application = UIApplication.sharedApplication()

    var dataToSegue = ["", "", "" , ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.locationPicker.delegate = self
        self.locationPicker.dataSource = self
        self.categoriesPicker.delegate = self
        self.categoriesPicker.dataSource = self
        self.formPicker.delegate = self
        self.formPicker.dataSource = self
        
        locations = ["Select a Location", "Bloomingdale", "Cayuga", "Clinton", "Crawfordsville", "Terre Haute"]
        categories = ["Select a Category", "Consent", "New Patient", "Notice", "Sliding Fee Scale", "Student Forms"]
        
        consentForms = ["Select a Form", "Behavioral Health Release of Info", "Minor Child", "Release of Information", "Release of Records", "Telemedicine"]
        newpatForms = ["Select a Form", "Adult", "Child"]
        noticeForms = ["Select a Form", "Acknowledgement of Bill of Rights", "Bill of Rights", "Privacy Practice"]
        slidingForms = ["Select a Form", "Sliding Fee Scale"]
        studentForms = ["Select a Form", "ISHAA Physical", "MSBHC Enrollment"]
        
        consentFiles = ["behavioral_health_release.pdf", "minor_child_consent_to_treat.pdf",  "release_of_information.pdf", "", "telemedicine_consent.pdf"]
        newpatFiles = ["new_patient_packet_adult_bloomcayclint.pdf", "new_patient_packet_adult_crawfordsville.pdf", "new_patient_packet_adult_terrehaute.pdf", "new_patient_packet_child_bloomcayclint.pdf", "new_patient_packet_child_crawfordsville.pdf", "new_patient_packet_child_terrehaute.pdf"]
        noticeFiles = ["acknowledgement_receipt.pdf", "patient_bill_of_rights.pdf", "sliding_fee_scale_reqs.pdf"]
        recordFiles = ["records_release_bloomingdale.pdf", "records_release_cayuga.pdf", "records_release_clinton.pdf", "records_release_crawfordsville.pdf", "records_release_terre_haute.pdf"]
        slidingFiles = ["sliding_fee_scale_reqs.pdf"]
        studentFiles = ["ihsaa_physical.pdf", "msbhc_student_enrollment.pdf"]
        

        
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
        if(pickerView == locationPicker){
            return locations.count
        }else if(pickerView == categoriesPicker){
            return categories.count
        }else{
            if(categorySelection == 1){
                finalForms = consentForms
                return consentForms.count
            }else if(categorySelection == 2){
                finalForms = newpatForms
                return newpatForms.count
            }else if(categorySelection == 3){
                finalForms = noticeForms
                return noticeForms.count
            }else if(categorySelection == 4){
                finalForms = slidingForms
                return slidingForms.count
            }else{
                finalForms = studentForms
                return studentForms.count
            }
        }
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == locationPicker){
            return locations[row]
        }else if(pickerView == categoriesPicker){
            return categories[row]
        }else{
            return finalForms[row]
        }
    }
    
    // When a selection is made by the user
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(pickerView == locationPicker){
            if(row == 0){
                categoriesPicker.hidden = true
                formPicker.hidden = true
                categoriesPicker.selectRow(0, inComponent: 0, animated: true)
                formPicker.selectRow(0, inComponent: 0, animated: true)
            }else{
                locationSelection = row
                categoriesPicker.hidden = false
            }
        }else if(pickerView == categoriesPicker){
            if(row == 0){
                formPicker.hidden = true
                formPicker.selectRow(0, inComponent: 0, animated: true)
            }else{
                categorySelection = row
                self.formPicker.reloadAllComponents()
                formPicker.hidden = false
            }
        }else{
            if(row != 0){
                //Release of Records selected which has different forms for each location
                if(categorySelection == 1 && row == 4){
                    websiteUrlCombine = "https://valleyprohealth.org/files/forms/en/" + recordFiles[locationSelection - 1]
                    //New Patient selected which has different forms for some locations
                }else if(categorySelection == 2){
                    //Adult Selected
                    if(row == 1){
                        if(locationSelection == 5){
                            websiteUrlCombine = "https://valleyprohealth.org/files/forms/en/" + newpatFiles[2]
                        }else if(locationSelection == 4){
                            websiteUrlCombine = "https://valleyprohealth.org/files/forms/en/" + newpatFiles[1]
                        }else{
                            websiteUrlCombine = "https://valleyprohealth.org/files/forms/en/" + newpatFiles[0]
                        }
                        //Child Selected
                    }else if(row == 2){
                        if(locationSelection == 5){
                            websiteUrlCombine = "https://valleyprohealth.org/files/forms/en/" + newpatFiles[5]
                        }else if(locationSelection == 4){
                            websiteUrlCombine = "https://valleyprohealth.org/files/forms/en/" + newpatFiles[4]
                        }else{
                            websiteUrlCombine = "https://valleyprohealth.org/files/forms/en/" + newpatFiles[3]
                        }
                    }
                    //Everything besides new patient and release of records
                }else{
                        if(categorySelection == 1){
                            websiteUrlCombine = "https://valleyprohealth.org/files/forms/en/" +  consentFiles[row - 1]
                        }else if(categorySelection == 3){
                            websiteUrlCombine = "https://valleyprohealth.org/files/forms/en/" + noticeFiles[row - 1]
                        }else if(categorySelection == 4){
                            websiteUrlCombine = "https://valleyprohealth.org/files/forms/en/" + slidingFiles[row - 1]
                        }else if(categorySelection == 5){
                            websiteUrlCombine = "https://valleyprohealth.org/files/forms/en/" + studentFiles[row - 1]
                        }
                }
                let websiteUrl: NSURL = NSURL(string: websiteUrlCombine)!
                application.openURL(websiteUrl)
                formPicker.selectRow(0, inComponent: 0, animated: false)
            }
        }
    
    }
}