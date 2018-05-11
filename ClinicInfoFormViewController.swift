//
//  ClinicInfoFormViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 10/21/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class ClinicInfoFormViewController: UIViewController {

    // MARK: - Outlets -
    // MARK: Buttons
    @IBOutlet weak var cancelButton: UIButton!
    // MARK: ImageViews
    @IBOutlet weak var locationImage: UIImageView!
    // MARK: Views
    @IBOutlet weak var contactInfoScroll: UIScrollView!
    @IBOutlet weak var contactInfoContainer: UIView!
    // MARK: Labels
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var addressLabel1: UILabel!
    @IBOutlet weak var addressLabel2: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var faxLabel: UILabel!
    @IBOutlet weak var hoursTitleLabel: UILabel!
    // MARK: Values
    @IBOutlet weak var contactInfoContainerHeight: NSLayoutConstraint!
    
    // MARK: - Global Variables -
    // MARK: Arrays
    var officeHours = ["8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m."]
    var rockHours = ["7:30 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","7:30 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","7:30 a.m. - 5:00 p.m."]
    var terreHours = ["8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:30 a.m. - 5:00 p.m.","8:00 a.m. - 4:30 p.m."]
   
    var contactInfo = [
        "contactInfoBloom1" : NSLocalizedString("201 W. Academy St.", comment:"Contact Info Bloomingdale"),
        "contactInfoBloom2" : NSLocalizedString("Bloomingdale, IN 47832", comment:"Contact Info Bloomingdale"),
        "contactInfoBloom3" : NSLocalizedString("(765) 498–9000", comment:"Contact Info Bloomingdale"),
        "contactInfoBloom4" : NSLocalizedString("(765) 498–9004", comment:"Contact Info Bloomingdale"),
        
        "contactInfoCay1" : NSLocalizedString("703 W. Park Street", comment:"Contact Info Cayuga"),
        "contactInfoCay2" : NSLocalizedString("Cayuga, IN 47928", comment:"Contact Info Cayuga"),
        "contactInfoCay3" : NSLocalizedString("(765) 492–9042", comment:"Contact Info Cayuga"),
        "contactInfoCay4" : NSLocalizedString("(765) 492–9048", comment:"Contact Info Cayuga"),
        
        "contactInfoClint1" : NSLocalizedString("777 S. Main Street, Suite 100", comment:"Contact Info Clinton"),
        "contactInfoClint2" : NSLocalizedString("Clinton, IN 47842", comment:"Contact Info Clinton"),
        "contactInfoClint3" : NSLocalizedString("(765) 828–1003", comment:"Contact Info Clinton"),
        "contactInfoClint4" : NSLocalizedString("(765) 828–1030", comment:"Contact Info Clinton"),
        
        "contactInfoCraw1" : NSLocalizedString("1810 Layfayette Ave.", comment:"Contact Info Crawfordsville"),
        "contactInfoCraw2" : NSLocalizedString("Crawfordsville, IN 47933", comment:"Contact Info Crawfordsville"),
        "contactInfoCraw3" : NSLocalizedString("(765) 362–5100", comment:"Contact Info Crawfordsville"),
        "contactInfoCraw4" : NSLocalizedString("(765) 362–5171", comment:"Contact Info Crawfordsville"),
        
        "contactInfoRock1" : NSLocalizedString("727 N Lincoln Rd", comment:"Contact Info Crawfordsville"),
        "contactInfoRock2" : NSLocalizedString("Rockville, IN 47872", comment:"Contact Info Crawfordsville"),
        "contactInfoRock3" : NSLocalizedString("(765) 569-1123", comment:"Contact Info Crawfordsville"),
        "contactInfoRoc4" : NSLocalizedString("(765) 569-6412", comment:"Contact Info Crawfordsville"),
        
        "contactInfoTerre1" : NSLocalizedString("1530 North 7th Street, Suite 201", comment:"Contact Info Terre Haute"),
        "contactInfoTerre2" : NSLocalizedString("Terre Haute, IN 47807", comment:"Contact Info Terre Haute"),
        "contactInfoTerre3" : NSLocalizedString("(812) 238–7631", comment:"Contact Info Terre Haute"),
        "contactInfoTerre4" : NSLocalizedString("(812) 238–7003", comment:"Contact Info Terre Haute"),]
    var locationHours1 = [
        NSLocalizedString("Monday - Friday", comment:"Location Hours Bloomingdale"),
        NSLocalizedString("8:00 am to 5:00 pm", comment:"Location Hours Bloomingdale"),
        NSLocalizedString("Closed", comment:"Location Hours Bloomingdale"),
        NSLocalizedString("12:00 pm to 1:00 pm", comment:"Location Hours Bloomingdale"),
        NSLocalizedString("Extended Hours", comment:"Location Hours Bloomingdale"),
        NSLocalizedString("Monday", comment:"Location Hours Bloomingdale"),
        NSLocalizedString("5:00 pm to 8:00 pm", comment:"Location Hours Bloomingdale")]
    var locationHours2 = [
        NSLocalizedString("Monday - Friday", comment:"Location Hours Cayuga"),
        NSLocalizedString("8:00 am to 5:00 pm", comment:"Location Hours Cayuga"),
        NSLocalizedString("Closed", comment:"Location Hours Cayuga"),
        NSLocalizedString("12:00 pm to 1:00 pm", comment:"Location Hours Cayuga"),
        NSLocalizedString("Extended Hours", comment:"Location Hours Cayuga"),
        NSLocalizedString("Wednesday", comment:"Location Hours Cayuga"),
        NSLocalizedString("5:00 pm to 8:00 pm", comment:"Location Hours Cayuga")]
    var locationHours3 = [
        NSLocalizedString("Monday - Friday", comment:"Location Hours Clinton"),
        NSLocalizedString("8:00 am to 5:00 pm", comment:"Location Hours Clinton"),
        NSLocalizedString("Closed", comment:"Location Hours Clinton"),
        NSLocalizedString("12:00 pm to 1:00 pm", comment:"Location Hours Clinton"),
        NSLocalizedString("Phone calls accepted during this time.", comment:"Location Hours Clinton"),
        NSLocalizedString("After-Hours", comment:"Location Hours Clinton"),
        NSLocalizedString("Monday - Thursday", comment:"Location Hours Clinton"),
        NSLocalizedString("5:00 pm to 8:00 pm", comment:"Location Hours Clinton"),
        NSLocalizedString("Saturday", comment:"Location Hours Clinton"),
        NSLocalizedString("9:00 am to 1:00 pm", comment:"Location Hours Clinton")]
    var locationHours4 = [
        NSLocalizedString("Monday - Friday", comment:"Location Hours Crawfordsville"),
        NSLocalizedString("8:00 am to 5:00 pm", comment:"Location Hours Crawfordsville"),
        NSLocalizedString("Closed", comment:"Location Hours Crawfordsville"),
        NSLocalizedString("12:00 pm to 1:00 pm", comment:"Location Hours Crawfordsville"),
        NSLocalizedString("Phone calls accepted during this time.", comment:"Location Hours Crawfordsville")]
    var locationHours5 = [
        NSLocalizedString("Monday, Wednesday, Friday", comment:"Location Hours Rockville"),
        NSLocalizedString("7:30 am to 5:00 pm", comment:"Location Hours Rockville"),
        NSLocalizedString("Tuesday, Thursday", comment:"Location Hours Rockville"),
        NSLocalizedString("8:00 am to 5:00 pm", comment:"Location Hours Rockville"),
        NSLocalizedString("Closed", comment:"Location Hours Rockville"),
        NSLocalizedString("12:30 p.m. to 1:30 p.m.", comment:"Location Hours Rockville")]
    var locationHours6 = [
        NSLocalizedString("Monday - Wednesday", comment:"Location Hours Terre Haute"),
        NSLocalizedString("8:00 am to 5:00 pm", comment:"Location Hours Terre Haute"),
        NSLocalizedString("Thursday", comment:"Location Hours Terre Haute"),
        NSLocalizedString("8:30 am to 5:00 pm", comment:"Location Hours Terre Haute"),
        NSLocalizedString("Friday", comment:"Location Hours Terre Haute"),
        NSLocalizedString("8:00 am to 4:30 pm", comment:"Location Hours Terre Haute"),
        NSLocalizedString("Closed", comment:"Location Hours Terre Haute"),
        NSLocalizedString("12:00 p.m. to 1:00 p.m.,", comment:"Location Hours Terre Haute"),
        NSLocalizedString("Phone calls accepted during this time.", comment:"Location Hours Terre Haute")]
    var dataSegue = ["", ""]
    // MARK: Defaults
    let defaults = UserDefaults.standard
    
    
    //MARK: - View Lifecyle -
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Set location label
        locationLabel.text = dataSegue[0]
            
        //Set location image
        let locationImageName = dataSegue[0] + "_location_pic"
        locationImage.image = UIImage(named:locationImageName)

        //Set contact info
        var locationIndex = locationIndexCreation(locationIndex: (Int(dataSegue[1])! - 1) * 4)
        addressLabel1.text = contactInfo[locationIndex + "1"]
        addressLabel2.text = contactInfo[locationIndex + "2"]
        phoneLabel.text = contactInfo[locationIndex + "3"]
        faxLabel.text = contactInfo[locationIndex + "4"]
        
        //Set Hours
        let hoursHeight = setLocationHours()
        
        contactInfoContainerHeight.constant += CGFloat(hoursHeight)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
       // Used to make status bar text black so that it is legible
        UIApplication.shared.statusBarStyle = .default
    }
    override func viewWillDisappear(_ animated: Bool) {
        // Used to make status bar text back to white
        UIApplication.shared.statusBarStyle = .lightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: -Set Location Hours-
    func locationIndexCreation(locationIndex: Int) -> String {
    /*
         Arguments:   locationIndex - location selected in integer form
         Description: Takes the locationIndex and transforms into a usable string.
         Returns:     newLocationIndex - location selected in usable string form.
    */
        var newLocationIndex = ""
        if(locationIndex == 1){
            newLocationIndex = "contactInfoBloom"
        }else if(locationIndex == 2){
            newLocationIndex = "contactInfoCay"
        }else if(locationIndex == 3){
            newLocationIndex = "contactInfoClint"
        }else if(locationIndex == 4){
            newLocationIndex = "contactInfoCraw"
        }else if(locationIndex == 5){
            newLocationIndex = "contactInfoRock"
        }else{
            newLocationIndex = "contactInfoTerre"
        }
        return newLocationIndex
    }
    func setLocationHours() -> Int {
    /*
         Arguments:   None
         Description: Displays the location hours
         Returns:     Returns the calculated height of the hours section.
    */
        //Set hours for each weekday for location chosen by user
        var locationHours = [""]
        
        //Select the correct location hours
        locationHours = selectLocationHours()
        
        //Get the total height of the hours being added in
        var hoursHeight = 0
        
        //Starting coordinates for the hours
        var hoursYCoordinates = hoursTitleLabel.center.x + 35
        
        //Go through all of the hours of the selected location and display them on the screen
        for hours in locationHours{
            let hoursLabel = UILabel()
            
            //Sets the title for those locations that have extended/after-hours
            if(hours == "Extended Hours" || hours == "After-Hours" || hours == "Horas extendidas" ||
                hours == "Después de horas"){
                hoursLabel.font = UIFont(name: "FranklinGothic-Medium", size: 22.0)
                hoursLabel.textColor = CustomColors.vpchcColors("blue")
                hoursHeight += 47
            }else{
                hoursLabel.font = UIFont(name: "System", size: 18.0)
                hoursLabel.textColor = UIColor.black
                hoursHeight += 43
            }
            hoursLabel.text = hours
            
            //Sets the width and the position of the label
            hoursLabel.sizeToFit()
              //Statement is checking if the device is an ipad so that the spacing can be adjusted
            if UIDevice.current.userInterfaceIdiom == .pad{
                hoursLabel.center.x = self.view.center.x - 108
            }else{
                hoursLabel.center.x = self.view.center.x
            }
            hoursLabel.center.y = hoursYCoordinates
            hoursYCoordinates += 25
            
            contactInfoContainer.addSubview(hoursLabel)
        }
        return hoursHeight
    }
    func selectLocationHours() -> [String]{
    /*
         Arguments:   None
         Description: Selects the array containing the hours selected.
         Returns:     Array containing the hours of the selected location.
    */
        let locationIndex = dataSegue[1]
        if (locationIndex == "1"){
            return locationHours1
        }else if(locationIndex == "2"){
            return locationHours2
        }else if(locationIndex == "3"){
            return locationHours3
        }else if(locationIndex == "4"){
            return locationHours4
        }else if(locationIndex == "5"){
            return locationHours5
        }else{
            return locationHours6
        }
    }
   
    // MARK: - Navigation Buttons -
    @IBAction func cancelButton1Tap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
