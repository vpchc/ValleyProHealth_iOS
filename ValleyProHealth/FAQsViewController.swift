//
//  FAQsViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/14/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class FAQsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // MARK: - Outlets -
    // MARK: Buttons
    @IBOutlet weak var backButton: UIButton!
    // MARK: Pickers
    @IBOutlet weak var categoriesPicker: UIPickerView!

    // MARK: - Global Variables -
    // MARK: Arrays
    var categoriesList = [
        NSLocalizedString("Select a Category", comment: "A selection in the FAQs Category List"),
        NSLocalizedString("Billing/Insurance", comment: "A selection in the FAQs Category List"),
        NSLocalizedString("Miscellaneous", comment: "A selection in the FAQs Category List"),
        NSLocalizedString("New Patients", comment: "A selection in the FAQs Category List"),
        NSLocalizedString("Services", comment: "A selection in the FAQs Category List")]
    var dataToSegue = ["", ""]
    
    // MARK: - View Lifecyle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup Cateogry Picker
        self.categoriesPicker.delegate = self
        self.categoriesPicker.dataSource = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation Buttons -
    @IBAction func backButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Picker Setup -
    // number of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // Number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoriesList.count
    }
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoriesList[row]
    }
    // Row Selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if( row != 0){
            // Setup data to send in segue, reset category picker, then perform the segue with the data
            dataToSegue[0] = categoriesList[row]
            dataToSegue[1] = String(row)
            categoriesPicker.selectRow(0, inComponent: 0, animated: false)
            self.performSegue(withIdentifier: "FAQsDataSegue", sender: self)
        }
    }
    
    // MARK: - Segue Setup -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FAQsDataSegue" {
            if let destination = segue.destination as? FAQsFormViewController{
                destination.dataSegue[0] = (dataToSegue[0])
                destination.dataSegue[1] = (dataToSegue[1])
            }
        }
    }
}
