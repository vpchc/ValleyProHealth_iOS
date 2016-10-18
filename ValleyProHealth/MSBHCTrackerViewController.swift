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
    @IBOutlet weak var downloadButton: UIButton!

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    let statusOpenText      = NSLocalizedString("Open", comment: "MSBHC Open Status")
    let statusClosedText    = NSLocalizedString("Closed", comment: "MSBHC Closed Status")
    let statusOpenSoonText  = NSLocalizedString("Opening Soon", comment: "MSBHC Opening Soon Status")
    let statusCloseSoonText = NSLocalizedString("Closing Soon", comment: "MSBHC Closing Soon Status")
    let statusEnRouteText   = NSLocalizedString("En Route", comment: "MSBHC En Route Status")
    
    let outdatedLine1Text = NSLocalizedString("Schedule Outdated", comment: "Outdated Text")
    let outdatedLine2Text = NSLocalizedString("Please", comment: "Outdated Text")
    let outdatedLine3Text = NSLocalizedString("Restart App", comment: "Outdated Text")
    
    let toastDownloadSchedule = NSLocalizedString("Downloading MSBHC Schedule…", comment: "Toast Download MSBHC Schedule")
    
    var tablecontroller: BusTableViewController!
    
    
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
    
    @IBAction func downloadButtonTap(_ sender: AnyObject) {
        let websiteUrl: URL = URL(string:"https://valleyprohealth.org/files/schedule/current_schedule.pdf")!
        let application = UIApplication.shared
        
        self.view.makeToast(toastDownloadSchedule)
        application.openURL(websiteUrl)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BusDataSegue" {
            if let destination = segue.destination as? BusTableViewController{
               tablecontroller = destination
            }
        }
    }
    
    func busMain() {
        let locationsForToday = defaults.object(forKey:"busSchedule") as? [String] ?? [String]()
        var busCheck = [Int]()
        var busInfo = [String]()
        var busLocation = ""
        var busHours = ""
        var busStatus =  ""
        
        busCheck = busLocationCheck(locations: locationsForToday)
        let currentLocation = locationsForToday[busCheck[0]].components(separatedBy: ",")
        
        if(dayCheck()){
            busLocation = currentLocation[0]
            busHours = currentLocation[1]
            busStatus = busStatusSet(busCheck: busCheck[1])
        }else{
            busLocation = outdatedLine1Text
            busHours = outdatedLine2Text
            busStatus = outdatedLine3Text
        }
        
        busInfo.append(busLocation)
        busInfo.append(busHours)
        busInfo.append(busStatus)
        tablecontroller.setText(busText: busInfo)
    }
    
    
    func busLocationCheck(locations: [String]) -> [Int]{
        var busScheduleSplit = [String]()
        var currentLocation = [Int]()
        var locationCheck = 0
        var flag = ""
        var count = 0
  
        for i in 0...locations.count - 1{
            count = i
            busScheduleSplit = locations[i].components(separatedBy: ",")
            locationCheck = busTimeCheck(location: busScheduleSplit, count: i)
            flag = busScheduleSplit[4].trimmingCharacters(in: .whitespacesAndNewlines)
            if(locationCheck != 0 || flag == "0"){
                break;
            }
        }
 
        currentLocation.append(count)
        currentLocation.append(locationCheck)
      
       
        return currentLocation
    }
    
    func busTimeCheck(location: [String], count: Int) -> Int{
        let flag = location[4].trimmingCharacters(in: .whitespacesAndNewlines)
        let currentMilliseconds = Date().milliseconds()

        //Bus start time in milliseconds
        let splitStartTime = location[2].components(separatedBy: ":")
        let busStartHour = Double(splitStartTime[0])! * 3.6e6
        let busStartMin  = Double(splitStartTime[1])! * 6e4
        let busStartTime = busStartHour + busStartMin
        
        //Bus end time in milliseconds
        let splitEndTime = location[3].components(separatedBy: ":")
        let busEndHour = Double(splitEndTime[0])! * 3.6e6
        let busEndMin  = Double(splitEndTime[1])! * 6e4
        let busEndTime = busEndHour + busEndMin
        
        //Where the comparing happens
        let compareStart = busStartTime - currentMilliseconds;
        let compareEnd   = busEndTime - currentMilliseconds;
        print("count")
        print(count)
        print("flag")
        print(flag)
        print("currentTime")
        print(currentMilliseconds)
        print("busStart")
        print(busStartTime)
        print("busEnd")
        print(busEndTime)
        print("compareStart")
        print(compareStart)
        print("compareEnd")
        print(compareEnd)
        
        if(compareEnd <= 1.8e6 && compareEnd > 0){
            return 4;
        }else if(count > 0 && flag == "1" && compareStart > 1.8e6){
            return 3;
        }else if(compareStart < 1.8e6 && compareStart > 0){
            return 2;
        }else if(compareStart <= 0 && compareEnd > 0){
            return 1;
        }else{
            return 0;
        }
    }
    
    func dayCheck() -> Bool{
        let scheduleDate = defaults.object(forKey:"busScheduleDay") as? Int
        
        let date = Date()
        let cal = Calendar.current
        let todaysDate = cal.ordinality(of: .day, in: .year, for: date)
        
        if(scheduleDate == todaysDate){
            return true
        }else{
            return false
        }
    }
    
    func busStatusSet(busCheck: Int) -> String{
        if(busCheck == 1){
            return statusOpenText
        }else if(busCheck == 2){
            return statusOpenSoonText
        }else if(busCheck == 3){
            return statusEnRouteText
        }else if(busCheck == 4){
            return statusCloseSoonText
        }else{
            return statusClosedText
        }
    }

}
