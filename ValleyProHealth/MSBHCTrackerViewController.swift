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
        
        self.view.makeToast("Downloading MSBHC Schedule…")
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
        
        busCheck = busLocationCheck(locations: locationsForToday)
        let currentLocation = locationsForToday[busCheck[0]].components(separatedBy: ",")
        
        let busLocation = currentLocation[0]
        let busHours = currentLocation[1]
        let busStatus = busStatusSet(busCheck: busCheck[1])
        
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
            busScheduleSplit = locations[i].components(separatedBy: ",")
            flag = busScheduleSplit[4]
            locationCheck = busTimeCheck(location: busScheduleSplit, count: i)
            if(locationCheck != 0 && flag == "0"){
                break;
            }
            print("looping")
            count = i
        }
        
        currentLocation.append(locationCheck)
        currentLocation.append(count)
       
        return currentLocation
    }
    
    func busTimeCheck(location: [String], count: Int) -> Int{
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
        if(compareEnd <= 1.8e6 && compareEnd > 0){
            return 4;
        }else if(compareStart <= 1.8e6 && compareStart > 0){
            if(location[4] == "1" && count != 0){
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
    
    func busStatusSet(busCheck: Int) -> String{
        if(busCheck == 1){
            return "Open"
        }else if(busCheck == 2){
            return "Opening Soon"
        }else if(busCheck == 3){
            return "En Route"
        }else if(busCheck == 4){
            return "Closing Soon"
        }else{
            return "Closed"
        }
    }

}
