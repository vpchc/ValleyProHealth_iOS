//
//  ClinicHoursFormViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/16/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class ClinicHoursFormViewController: UIViewController {
    
    //MARK: Labels
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationImage: UIImageView!

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

        //Set location image
        let locationImageName = dataSegue[0] + "_location_pic"
        locationImage.image = UIImage(named:locationImageName)
        
        //Doesn't set text when the location selected is Clinton, which has its own static controller due to Saturday Clinic
        print("dataSegue: " + dataSegue[1])
        if(dataSegue[1] != "3"){
            locationLabel.text = dataSegue[0]

            if(dataSegue[1] == "5"){
                tableController.setTableText(hours: terreHours)
            }else{
                tableController.setTableText(hours: bloomcaycrawHours)
            }
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
    @IBAction func cancelButton1(_ sender: AnyObject) {
         self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButton2(_ sender: AnyObject) {
         self.dismiss(animated: true, completion: nil)
    }
}
