//
//  ClinicHoursFormViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/16/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class ClinicHoursFormViewController: UIViewController {

    @IBOutlet weak var cancelButton1: UIButton!
    @IBOutlet weak var cancelButton2: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mondayHours: UILabel!
    @IBOutlet weak var tuesdayHours: UILabel!
    @IBOutlet weak var wednesdayHours: UILabel!
    @IBOutlet weak var thursdayHours: UILabel!
    @IBOutlet weak var fridayHours: UILabel!
    
    var bloomcaycrawHours = ["8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m."]
    var terreHours = ["8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:30 a.m. - 8:00 p.m.","8:00 a.m. - 4:30 p.m."]
    var dataSegue = ["", ""]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(dataSegue[1] != "3"){
            locationLabel.text = dataSegue[0]
            if(dataSegue[1] == "5"){
                mondayHours.text = terreHours[0]
                tuesdayHours.text = terreHours[1]
                wednesdayHours.text = terreHours[2]
                thursdayHours.text = terreHours[3]
                fridayHours.text = terreHours[4]
            }else{
                mondayHours.text = bloomcaycrawHours[0]
                tuesdayHours.text = bloomcaycrawHours[1]
                wednesdayHours.text = bloomcaycrawHours[2]
                thursdayHours.text = bloomcaycrawHours[3]
                fridayHours.text = bloomcaycrawHours[4]
           
            }
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func cancelButton1(sender: AnyObject) {
         self.dismissViewControllerAnimated(true, completion: nil)
    }
  
    @IBAction func cancelButton2(sender: AnyObject) {
         self.dismissViewControllerAnimated(true, completion: nil)
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
