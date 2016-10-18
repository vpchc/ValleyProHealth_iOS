//
//  FAQsViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/14/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class FAQsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //MARK: Buttons
    @IBOutlet weak var backButton: UIButton!
    //MARK: Pickers
    @IBOutlet weak var categoriesPicker: UIPickerView!

    //MARK: Arrays
    var categoriesList = [
        NSLocalizedString("Select a Category", comment: "A selection in the FAQs Category List"),
        NSLocalizedString("Billing/Insurance", comment: "A selection in the FAQs Category List"),
        NSLocalizedString("Miscellaneous", comment: "A selection in the FAQs Category List"),
        NSLocalizedString("New Patients", comment: "A selection in the FAQs Category List"),
        NSLocalizedString("Services", comment: "A selection in the FAQs Category List")]
    var dataToSegue = ["", ""]
    
    //MARK: View Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup Cateogry Picker
        self.categoriesPicker.delegate = self
        self.categoriesPicker.dataSource = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Decision Buttons
    @IBAction func backButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: PickerSetup
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoriesList.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoriesList[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if( row != 0){
            dataToSegue[0] = categoriesList[row]
            dataToSegue[1] = String(row)
            categoriesPicker.selectRow(0, inComponent: 0, animated: false)
            self.performSegue(withIdentifier: "FAQsDataSegue", sender: self)
        }
    }
    
    //MARK: Segue Setup
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FAQsDataSegue" {
            if let destination = segue.destination as? FAQsFormViewController{
                destination.dataSegue[0] = (dataToSegue[0])
                destination.dataSegue[1] = (dataToSegue[1])
            }
        }
    }
}
