//
//  ContactInfoFormViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/16/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class ContactInfoFormViewController: UIViewController {

    // MARK: - Outlets -
    // MARK: Buttons
    @IBOutlet weak var cancelButton: UIButton!
    // MARK: Image Views
    @IBOutlet weak var locationImage: UIImageView!
    // MARK: Labels
    @IBOutlet weak var addressLine1Label: UILabel!
    @IBOutlet weak var addressLine2Label: UILabel!
    @IBOutlet weak var faxLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
   
    // MARK: - Global Variables -
    // MARK: Arrays
    let addressLine1 = ["201 W. Academy St.", "114 N. Division St.", "777 S. Main Street, Suite 100", "1810 Layfayette Ave.", "1530 N. 7th St., Suite 201"]
    let addressLine2 = ["Bloomingdale, IN 47832", "Cayuga, IN 47928", "Clinton, IN 47842", "Crawfordsville, IN 47933", "Terre Haute, IN 47807"]
    let faxNumbers = ["(765) 498-9004", "(765) 492-9048", "(765) 828-1030", "(765) 362-5171", "(812) 238-7003"]
    let phoneNumbers = ["(765) 498-9000", "(765) 492-9042", "(765) 828-1003", "(765) 362-5100", "(812) 238-7631"]
    var dataSegue = ["", ""]
    
    // MARK: - View Lifecyle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set location image
        let locationImageName = dataSegue[0] + "_location_pic"
        locationImage.image = UIImage(named:locationImageName)

        //Set all text on screen
        locationLabel.text = dataSegue[0]
        let locationIndex = Int(dataSegue[1])! - 1
        addressLine1Label.text = addressLine1[locationIndex]
        addressLine2Label.text = addressLine2[locationIndex]
        phoneLabel.text = phoneNumbers[locationIndex]
        faxLabel.text = faxNumbers[locationIndex]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation Buttons -
    @IBAction func cancelButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
}
