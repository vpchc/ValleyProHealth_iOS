//
//  ClinicInfoFormViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 10/21/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class ClinicInfoFormViewController: UIViewController {

    //MARK: Labels
    @IBOutlet weak var locationLabel: UILabel!
   
    @IBOutlet weak var locationImage1: UIImageView!
    @IBOutlet weak var locationImage2: UIImageView!
    
    
    //MARK: Buttons

    @IBOutlet weak var cancelButton1: UIButton!
    @IBOutlet weak var cancelButton2: UIButton!
    
    
    //MARK: Arrays
    var bloomcaycrawHours = ["8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m."]
    var terreHours = ["8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:30 a.m. - 8:00 p.m.","8:00 a.m. - 4:30 p.m."]
    var dataSegue = ["", ""]
    
    var tableController: LocationsHoursTableViewController!
    
    //MARK: View Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Doesn't set text when the location selected is Clinton, which has its own static controller due to Saturday Clinic
        print("dataSegue: " + dataSegue[1])
        if(dataSegue[1] != "3"){
            locationLabel.text = dataSegue[0]
            //Set location image
            let locationImageName = dataSegue[0] + "_location_pic"
            locationImage1.image = UIImage(named:locationImageName)

            if(dataSegue[1] == "5"){
                tableController.setTableText(hours: terreHours)
            }else{
                tableController.setTableText(hours: bloomcaycrawHours)
            }
        }else{
            //Set location image
            let locationImageName = dataSegue[0] + "_location_pic"
            locationImage2.image = UIImage(named:locationImageName)

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HoursTableSegue" {
            if let destination = segue.destination as? LocationsHoursTableViewController{
                tableController = destination
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Decision Buttons
    @IBAction func cancelButton1Tap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButtonTap2(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

}
