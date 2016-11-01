//
//  OptionsViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/29/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit
import Toast_Swift

class OptionsViewController: UIViewController {

    // MARK: - Outlets -
    // MARK: Buttons
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    // MARK: - Global Variables -
    // MARK: Controller References
    var tableController: OptionTableViewController!
    
    // MARK: - View Lifecyles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation Buttons -
    @IBAction func cancelButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButtonTap(_ sender: AnyObject) {
        tableController.saveChanges()
    }
    
    // MARK: - Segue Setup -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "OptionsTableDataSegue") {
            //This is used to reference the saveChanges function
            let childViewController = segue.destination as! OptionTableViewController
            tableController = childViewController
        }
    }
    
}


