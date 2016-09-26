//
//  MSBHCTrackerViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/23/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class MSBHCTrackerViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the date label
        let currentDate = Date()
        dateLabel.text = currentDate.dateToString()
        
        busMain()
        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func busMain() {
        let locations = defaults.object(forKey:"busSchedule") as? [String] ?? [String]()
        var busScheduleSplit = [String]()
        var r = 0
        var busStatus = ""
        for i in 0...locations.count{
            busScheduleSplit = locations[i].components(separatedBy: ",")
            r = busTimeCheck(location: busScheduleSplit)
            if(r != 0){
                break;
            }
        }
        if(r == 1){
            busStatus = "Open"
        }else if(r == 2){
            busStatus = "Opening Soon"
        }else if(r == 3){
            busStatus = "En Route"
        }else if(r == 4){
            busStatus = "Closing Soon"
        }else{
            busStatus = "Closed"
        }
        locationLabel.text = busScheduleSplit[0]
        hoursLabel.text = busScheduleSplit[1]
        statusLabel.text = busStatus
        
    }
    
    func busTimeCheck(location: [String]) -> Int{
        let currentMilliseconds = NSDate().timeIntervalSince1970
        
        //Bus start time in milliseconds
        let splitStartTime = location[0].components(separatedBy: ":")
        let busStartHour = Double(splitStartTime[0])! * 3.6e6
        let busStartMin  = Double(splitStartTime[1])! * 6e4
        let busStartTime = busStartHour + busStartMin
        
        //Bus end time in milliseconds
        let splitEndTime = location[1].components(separatedBy: ":")
        let busEndHour = Double(splitEndTime[0])! * 3.6e6
        let busEndMin  = Double(splitEndTime[1])! * 6e4
        let busEndTime = busEndHour + busEndMin
        
        //Where the comparing happens
        let compareStart = busStartTime - currentMilliseconds;
        let compareEnd   = busEndTime - currentMilliseconds;
        if(compareEnd <= 1.8e6 && compareEnd > 0){
            return 4;
        }else if(compareStart <= 1.8e6 && compareStart > 0){
            if(location[4] == "1"){
                return 3;
            }else{
                return 2;
            }
        }else if(compareStart <= 0 && compareEnd > 0){
            return 1;
        }else{
            return 0;
        }
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
