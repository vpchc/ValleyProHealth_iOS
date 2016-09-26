//
//  ContactInfoFormViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/16/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class ContactInfoFormViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var addressLine1Label: UILabel!
    @IBOutlet weak var addressLine2Label: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var faxLabel: UILabel!
    
    var dataSegue = ["", ""]
    
    var addressLine1 = ["201 W. Academy St.", "114 N. Division St.", "777 S. Main Street, Suite 100", "1810 Layfayette Ave.", "1530 N. 7th St., Suite 201"]
    var addressLine2 = ["Bloomingdale, IN 47832", "Cayuga, IN 47928", "Clinton, IN 47842", "Crawfordsville, IN 47933", "Terre Haute, IN 47807"]
    var phoneNumbers = ["(765) 498-9000", "(765) 492-9042", "(765) 828-1003", "(765) 362-5100", "(812) 238-7631"]
    var faxNumbers = ["(765) 498-9004", "(765) 492-9048", "(765) 828-1030", "(765) 362-5171", "(812) 238-7003"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationLabel.text = dataSegue[0]
        
        let locationImageName = dataSegue[0] + "_location_pic"
        
        locationImage.image = UIImage(named:locationImageName)
        
        var locationIndex = 0
        if(dataSegue[1] == "1"){
            locationIndex = 0
        }else if(dataSegue[1] == "2"){
            locationIndex = 1
        }else if(dataSegue[1] == "3"){
            locationIndex = 2
        }else if(dataSegue[1] == "4"){
            locationIndex = 3
        }else if(dataSegue[1] == "5"){
            locationIndex = 4
        }
        
        addressLine1Label.text = addressLine1[locationIndex]
        addressLine2Label.text = addressLine2[locationIndex]
        phoneLabel.text = phoneNumbers[locationIndex]
        faxLabel.text = faxNumbers[locationIndex]
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelButton(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
