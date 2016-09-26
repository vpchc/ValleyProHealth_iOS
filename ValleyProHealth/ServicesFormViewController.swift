//
//  ServicesFormViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/18/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class ServicesFormViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var servicesLabel: UILabel!
    @IBOutlet weak var servicesTable: UITableView!
    
    let cellReuseIdentifier = "cell"
    let bhServices = ["•Child/Adolescent counseling", "•Crisis counseling", "•Family counseling", "•Psychiatry", "•Testing/Assessment(upon referral)"]
    let dentalServices = ["•Preventive and restorative services"]
    let patsupportServices = ["•Community Health Workers","-Provide assistance navigating the Insurance Marketplace, Healthy Indiana Plan, and Medicaid applications", "-Educate patients on preventive healthcare behaviors", "-Help patients find necessities like food, clothes, and toiletries", "•Patient Care Coordinator", "-Work with a Care Coordinators and learn how to manage chronic health concerns, and take steps to improve your health Care Coordinators and learn how to manage chronic health concerns, and take steps to improve your health Care Coordinators and learn how to manage chronic health concerns, and take steps to improve your health Care Coordinators and learn how to manage chronic health concerns, and take steps to improve your health", "-Are patient advocates and your navigator through the healthcare system"]
    let primcare1 = ["•Acute Illness", "•Chronic Disease Care", "•CDL Exam", "•Family Planning", "•Geriatric Care", "•Immunizations", "•Laboratory Services", "•Men's Health", "•Minor Surgery", "•Nutritional Counseling", "•Physical Exam", "•Preventive Care", "•Well Child Visits", "•Women's Health"]
    let primcare2 = ["•Acute Illness", "•Chronic Disease Care", "•Colposcopy", "•CDL Exam", "•Family Planning", "•Geriatric Care", "•Immunizations", "•Labor and Delivery", "•Laboratory Services", "•Men's Health", "•Minor Surgery", "•Nutritional Counseling", "•Pregnancy Care", "•Preventive Care", "•Physical Exam", "•Well Child Visits", "•Women's Health", "•Vasectomy"]
    var servicesList = [String]()
    var dataSegue = ["", "", "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationLabel.text = dataSegue[0]
        servicesLabel.text = dataSegue[1]
        
        if(dataSegue[3] == "1"){
            servicesList = bhServices
        }else if(dataSegue[3] == "2"){
            servicesList = dentalServices
        }else if(dataSegue[3] == "3"){
            servicesList = patsupportServices
        }else if(dataSegue[3] == "4"){
            if(dataSegue[2] == "6"){
                servicesList = primcare2
            }else{
                servicesList = primcare1
            }
        }
        
        // Register the table view cell class and its reuse id
        self.servicesTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        servicesTable.delegate = self
        servicesTable.dataSource = self
        
        servicesTable.estimatedRowHeight = 44.0
        servicesTable.rowHeight = UITableViewAutomaticDimension
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTap(_ sender: AnyObject) {
         self.dismiss(animated: true, completion: nil)
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.servicesList.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.servicesTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = self.servicesList[(indexPath as NSIndexPath).row]
        
        //Used to wrap the words
        cell.textLabel?.numberOfLines = 0
        
        cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size:20)
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \((indexPath as NSIndexPath).row).")
    }
}
