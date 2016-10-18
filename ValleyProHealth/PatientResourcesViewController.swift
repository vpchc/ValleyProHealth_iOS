//
//  PatientResourcesViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/14/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class PatientResourcesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var categoriesPicker: UIPickerView!
    
    var categoriesList = [String]()
    var dataToSegue = ["", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data:
        self.categoriesPicker.delegate = self
        self.categoriesPicker.dataSource = self
        
        categoriesList = [
            NSLocalizedString("Select a Category", comment: "Patient Resources Categories Directions"),
            NSLocalizedString("Diabetic Support Group", comment: "Patient Resources Categories Selection"),
            NSLocalizedString("Prescription Assistance", comment: "Patient Resources Categories Selection"),
            NSLocalizedString("Sliding Fee Scale", comment: "Patient Resources Categories Selection")]
        
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
        return categoriesList.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoriesList[row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PatientResourcesDataSegue" {
            if let destination = segue.destination as? PatientResourcesFormViewController{
                destination.dataSegue[0] = (dataToSegue[0])
                destination.dataSegue[1] = (dataToSegue[1])
            }
        }
    }
    
    // When a selection is made by the user
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row != 0){
            dataToSegue[0] = categoriesList[row]
            dataToSegue[1] = String(row)
            categoriesPicker.selectRow(0, inComponent: 0, animated: false)
            self.performSegue(withIdentifier: "PatientResourcesDataSegue", sender: self)
        }
    }

}
