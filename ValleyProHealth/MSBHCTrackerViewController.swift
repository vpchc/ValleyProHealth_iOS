//
//  MSBHCTrackerViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/23/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class MSBHCTrackerViewController: UIViewController {

    // MARK: - Outlets -
    // MARK: Buttons
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var downloadButton: UIButton!
    // MARK: Labels
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    // MARK: - Global Variables -
    // MARK: Controller Reference
    var tablecontroller: BusTableViewController!
    // MARK: Defaults
    let defaults = UserDefaults.standard
    // MARK: Strings
    let outdatedLine1Text     = NSLocalizedString("Schedule Outdated", comment: "Outdated Text")
    let outdatedLine2Text     = NSLocalizedString("Please", comment: "Outdated Text")
    let outdatedLine3Text     = NSLocalizedString("Restart App", comment: "Outdated Text")
    let statusOpenText        = NSLocalizedString("Open", comment: "MSBHC Open Status")
    let statusClosedText      = NSLocalizedString("Closed", comment: "MSBHC Closed Status")
    let statusOpenSoonText    = NSLocalizedString("Opening Soon", comment: "MSBHC Opening Soon Status")
    let statusCloseSoonText   = NSLocalizedString("Closing Soon", comment: "MSBHC Closing Soon Status")
    let statusEnRouteText     = NSLocalizedString("En Route", comment: "MSBHC En Route Status")
    let toastDownloadSchedule = NSLocalizedString("Downloading MSBHC Schedule…", comment: "Toast Download MSBHC Schedule")
    let toastNoNetwork        = NSLocalizedString("Please Check Your Network Connection", comment: "Toast No Network")
   
    // MARK: - View Lifecyle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the date label
        let storedDate = defaults.object(forKey:"busScheduleDate") as! String
        dateLabel.text = storedDate
        
        busMain()
    }
    override func viewWillAppear(_ animated: Bool) {
        // Used to make status bar text black so that it is legible
        UIApplication.shared.statusBarStyle = .default
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation Buttons
    @IBAction func cancelButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func downloadButtonTap(_ sender: AnyObject) {
        // Download MSBHC schedule
        let websiteUrl: URL = URL(string:"https://valleyprohealth.org/files/schedule/current_schedule.pdf")!
        self.view.makeToast(toastDownloadSchedule)
        UIApplication.shared.openURL(websiteUrl)
    }
    
    // MARK: - Segue Setup -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BusDataSegue" {
            if let destination = segue.destination as? BusTableViewController{
               tablecontroller = destination
            }
        }
    }
    
    // MARK: - Bus Functions -
    func busMain() {
    /*   
         Arguments:   None
         Description: Main function for bus schedule setup
         Returns:     Nothing
    */
        let locationsForToday = defaults.object(forKey:"busSchedule") as? [String] ?? [String]()
        var busCheck = [Int]()
        var busInfo = [String]()
        var busLocation = ""
        var busHours = ""
        var busStatus =  ""
        
        if(!dayCheck() || defaults.object(forKey:"busSchedule") == nil){// The stored schedule is out of date or there is no stored schedule
            busLocation = outdatedLine1Text
            busHours    = outdatedLine2Text
            busStatus   = outdatedLine3Text
            self.view.makeToast(toastNoNetwork, duration: 3.0 , position: .center)
        }else{
            // Check times for the location
            busCheck = busLocationCheck(locations: locationsForToday)
            
            // Sets current location based on results of busCheck
            let currentLocation = locationsForToday[busCheck[0]].components(separatedBy: ",")
        
            // Prepares the bus information that is displayed
            busLocation = currentLocation[0]
            busHours    = currentLocation[1]
            busStatus   = busStatusSet(busCheck: busCheck[1])
        }
        
        // Stores the bus information in an array and sends that to a function that displays the text on the screen
        busInfo.append(busLocation)
        busInfo.append(busHours)
        busInfo.append(busStatus)
        tablecontroller.setText(busText: busInfo)
    }
    
    func busLocationCheck(locations: [String]) -> [Int]{
    /*   
         Arguments:   locations - An array of integers which are the locations for that day
         Description: Checks the locations for the day and returns an index and status of the current location
         Returns:     currentLocation - Array with 1st index being the current location and 2nd index being the status of the location
    */
        var currentBusSchedule = [String]()
        var currentLocation = [Int]()
        var locationCheck = 0
        var flag = ""
        var count = 0
        
        // Runs through each location for that day and checks the time unless conditions are met
        for i in 0...locations.count - 1{
            count = i
            
            // Parses the location information from the ','s and stores them
            currentBusSchedule = locations[i].components(separatedBy: ",")
            
            // These are days when the bus is scheduled to be closed.
            if(currentBusSchedule[2].trimmingCharacters(in: .whitespacesAndNewlines) == "0:0"){
                break
            }
            
            // Actual comparing of the current time with the bus time
            locationCheck = busTimeCheck(location: currentBusSchedule, count: i)
            
            flag = currentBusSchedule[4].trimmingCharacters(in: .whitespacesAndNewlines)
            
            // If there the location is not closed or there is no other locations for that day
            if(locationCheck != 0 || flag == "0"){
                break
            }
        }
 
        currentLocation.append(count)
        currentLocation.append(locationCheck)
        return currentLocation
    }
    
    func busTimeCheck(location: [String], count: Int) -> Int{
    /*   
         Arguments:   locations - Array with current bus location information, count - Integer with current location count
         Description: Compares the current time with the bus time from the location that is being checked
         Returns:     Integer of the results of the comparing
    */
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
        if(compareEnd <= 1.8e6 && compareEnd > 0){// Closing soon
            return 4;
        }else if(count > 0 && compareStart > 1.8e6){// En Route
            return 3;
        }else if(compareStart < 1.8e6 && compareStart > 0){// Opening Soon
            return 2;
        }else if(compareStart <= 0 && compareEnd > 0){// Open
            return 1;
        }else{// Closed
            return 0;
        }
    }
    
    func busStatusSet(busCheck: Int) -> String{
    /*   
         Arguments:   busCheck - Integer that is the result of the busTimeCheck
         Description: Checks what busCheck is equal to and returns the appropriate text
         Returns:     String that is the status text to be displayed on the screen
    */
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
    
    func dayCheck() -> Bool{
    /*
         Arguments:   None
         Description: Checks if the stored bus schedule is up to date
         Returns:     Bool - true is if the stored schedule is the current day, false is if the schedule is outdated
    */
        let scheduleDate = defaults.object(forKey:"busScheduleDay") as? Int
        
        // Sets up todays day of the year
        let date = Date()
        let cal = Calendar.current
        let todaysDate = cal.ordinality(of: .day, in: .year, for: date)
        
        if(scheduleDate == todaysDate){
            return true
        }else{
            return false
        }
    }
    
   

}
