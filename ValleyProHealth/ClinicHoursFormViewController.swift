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
    @IBOutlet weak var mondayHours: UILabel!
    @IBOutlet weak var tuesdayHours: UILabel!
    @IBOutlet weak var wednesdayHours: UILabel!
    @IBOutlet weak var thursdayHours: UILabel!
    @IBOutlet weak var fridayHours: UILabel!
    //MARK: Buttons
    @IBOutlet weak var cancelButton1: UIButton!
    @IBOutlet weak var cancelButton2: UIButton!
    //MARK: Arrays
    var bloomcaycrawHours = ["8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m."]
    var terreHours = ["8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:30 a.m. - 8:00 p.m.","8:00 a.m. - 4:30 p.m."]
    var dataSegue = ["", ""]
    
    //MARK: View Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()

        //Doesn't set text when the location selected is Clinton, which has its own static controller due to Saturday Clinic
        if(dataSegue[1] != "3"){
            locationLabel.text = dataSegue[0]
            if(dataSegue[1] == "5"){
                mondayHours.text    = terreHours[0]
                tuesdayHours.text   = terreHours[1]
                wednesdayHours.text = terreHours[2]
                thursdayHours.text  = terreHours[3]
                fridayHours.text    = terreHours[4]
            }else{
                mondayHours.text    = bloomcaycrawHours[0]
                tuesdayHours.text   = bloomcaycrawHours[1]
                wednesdayHours.text = bloomcaycrawHours[2]
                thursdayHours.text  = bloomcaycrawHours[3]
                fridayHours.text    = bloomcaycrawHours[4]
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
