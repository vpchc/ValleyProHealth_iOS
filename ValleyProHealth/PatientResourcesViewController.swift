//
//  PatientResourcesViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/14/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class PatientResourcesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    // MARK: - Outlets -
    // MARK: Buttons
    @IBOutlet weak var backButton: UIButton!
    // MARK: Labels
    @IBOutlet weak var titleLabel: UILabel!
    // MARK: Pickers
    @IBOutlet weak var categoriesPicker: UIPickerView!
    
    // MARK: - Global Variables -
    // MARK: Arrays
    let categoriesList = [
        NSLocalizedString("Select a category", comment: "Patient Resources Categories Directions"),
        NSLocalizedString("Diabetic Support Group", comment: "Patient Resources Categories Selection"),
        NSLocalizedString("Prescription Assistance", comment: "Patient Resources Categories Selection"),
        NSLocalizedString("Sliding Fee Scale", comment: "Patient Resources Categories Selection")]
    var dataToSegue = ["", ""]
    // MARK: Defaults
    let defaults = UserDefaults.standard
    
    // MARK: - View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data to categories picker
        self.categoriesPicker.delegate = self
        self.categoriesPicker.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        //Shrinks some text size for Spanish locale
        if(defaults.object(forKey:"savedLocale") as! String == "es"){
            titleLabel?.font = UIFont(name: (titleLabel?.font.fontName)!, size:16)
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
        return categoriesList.count
    }
    // Row data
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoriesList[row]
    }
    // Row selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row != 0){
            dataToSegue[0] = categoriesList[row]
            dataToSegue[1] = String(row)
            categoriesPicker.selectRow(0, inComponent: 0, animated: false)
            self.performSegue(withIdentifier: "PatientResourcesDataSegue", sender: self)
        }
    }
    
    // MARK: - Segue Setup -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PatientResourcesDataSegue" {
            if let destination = segue.destination as? PatientResourcesFormViewController{
                destination.dataSegue[0] = (dataToSegue[0])
                destination.dataSegue[1] = (dataToSegue[1])
            }
        }
    }
}
