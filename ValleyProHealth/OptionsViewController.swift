//
//  OptionsViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/29/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit
import Toast_Swift

class OptionsViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var tableController: OptionTableViewController!
    var menuController: MenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

  
    @IBAction func saveButtonTap(_ sender: AnyObject) {
        tableController.saveChanges()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "OptionsSegue"){
            let childViewController = segue.destination as! MenuViewController
            menuController = childViewController
        }
        if (segue.identifier == "OptionsTableDataSegue") {
            //This is used to reference the paging left and right functions
            let childViewController = segue.destination as! OptionTableViewController
            tableController = childViewController
        }
    }
    
}


