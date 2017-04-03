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
    @IBOutlet weak var cancelButton1: UIButton!
    @IBOutlet weak var cancelButton2: UIButton!
    // MARK: ImageViews
    @IBOutlet weak var locationImage1: UIImageView!
    @IBOutlet weak var locationImage2: UIImageView!
    // MARK: Labels
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var titleLabel1: UILabel!
    @IBOutlet weak var titleLabel2: UILabel!
    
    // MARK: - Global Variables -
    // MARK: Arrays
    var officeHours = ["8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m."]
    var rockHours = ["7:30 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","7:30 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","7:30 a.m. - 5:00 p.m."]
    var terreHours = ["8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:30 a.m. - 5:00 p.m.","8:00 a.m. - 4:30 p.m."]
    var contactInfo = ["201 W. Academy St.",
                       "Bloomingdale, IN 47832",
                       "(765) 498–9000",
                       "Fax: (765) 498–9004",
                       "703 W. Park Street",
                       "Cayuga, IN 47928",
                       "(765) 492–9042",
                       "Fax: (765) 492–9048",
                       "777 S. Main Street, Suite 100",
                       "Clinton, IN 47842",
                       "(765) 828–1003",
                       "Fax: (765) 828–1030",
                       "1810 Layfayette Ave.",
                       "Crawfordsville, IN 47933",
                       "(765) 362–5100",
                       "Fax: (765) 362–5171",
                       "727 N Lincoln Rd",
                       "Rockville, IN 47872",
                       "(765) 569-1123",
                       "Fax: (765) 569-6412",
                       "1530 North 7th Street, Suite 201",
                       "Terre Haute, IN 47807",
                       "(812) 238–7631",
                       "Fax: (812) 238–7003"]
    
    var dataSegue = ["", ""]
    // MARK: Defaults
    let defaults = UserDefaults.standard
    // MARK: TableReferences
    var tableController: LocationsHoursTableViewController!
    
    
    //MARK: - View Lifecyle -
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if(dataSegue[1] != "3"){//Every Location except Clinton
            //Set location label
            locationLabel.text = dataSegue[0]
            
            //Set location image
            let locationImageName = dataSegue[0] + "_location_pic"
            locationImage1.image = UIImage(named:locationImageName)

            //Set Contact Info
            let indexIntConvert = Int(dataSegue[1])!
            let contactInfoIndex = (indexIntConvert - 1) * 4
            tableController.setTableContactInfo(index: contactInfoIndex, info: contactInfo)
            
            //Set the hours
            if(dataSegue[1] == "5"){
                tableController.setTableHours(hours: rockHours)
            }else if(dataSegue[1] == "6"){
                tableController.setTableHours(hours: terreHours)
            }else{
                tableController.setTableHours(hours: officeHours)
            }
        }else{//Clinton location
            //Set location image
            let locationImageName = dataSegue[0] + "_location_pic"
            locationImage2.image = UIImage(named:locationImageName)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        //Shrinks some text size for Spanish locale
        if(defaults.object(forKey:"savedLocale") as! String == "es"){
          if(dataSegue[1] == "3"){
            titleLabel2?.font = UIFont(name: (titleLabel2?.font.fontName)!, size:22)
          }else{
            titleLabel1?.font = UIFont(name: (titleLabel1?.font.fontName)!, size:22)
            }
        }
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
    
    // MARK: - Navigation Buttons -
    @IBAction func cancelButton1Tap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButtonTap2(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Segue Preperation -
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HoursTableSegue" {
            if let destination = segue.destination as? LocationsHoursTableViewController{
                tableController = destination
            }
        }
    }
}
