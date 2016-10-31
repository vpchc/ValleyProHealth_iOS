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
    var bloomcaycrawHours = ["8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m."]
    var terreHours = ["8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:00 a.m. - 5:00 p.m.","8:30 a.m. - 8:00 p.m.","8:00 a.m. - 4:30 p.m."]
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

            //Set the hours
            if(dataSegue[1] == "5"){
                tableController.setTableText(hours: terreHours)
            }else{
                tableController.setTableText(hours: bloomcaycrawHours)
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
