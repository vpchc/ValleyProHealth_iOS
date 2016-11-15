//
//  ServicesFormViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/18/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class ServicesFormViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Outlets -
    // MARK: Buttons
    @IBOutlet weak var cancelButton: UIButton!
    // MARK: Labels
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var servicesLabel: UILabel!
    // MARK: TableViews
    @IBOutlet weak var servicesTable: UITableView!
    
    // MARK: - Global Variables -
     // MARK: Arrays
    let bhServices = [
        NSLocalizedString("•Child/Adolescent counseling", comment: "Services BH"),
        NSLocalizedString("•Crisis counseling", comment: "Services BH"),
        NSLocalizedString("•Family counseling", comment: "Services BH"),
        NSLocalizedString("•Psychiatry", comment: "Services BH"),
        NSLocalizedString("•Testing/Assessment(upon referral)", comment: "Services BH")]
    let dentalServices = [
        NSLocalizedString("•Preventive and restorative services", comment: "Services Dental")]
    let patsupportServices = [
        NSLocalizedString("•Community Health Workers", comment: "Services Patient Support"),
        NSLocalizedString("-Provide assistance navigating the Insurance Marketplace, Healthy Indiana Plan, and Medicaid applications", comment: "Services Patient Support"),
        NSLocalizedString("-Educate patients on preventive healthcare behaviors", comment: "Services Patient Support"),
        NSLocalizedString("-Help patients find necessities like food, clothes, and toiletries", comment: "Services Patient Support"),
        NSLocalizedString("•Patient Care Coordinator", comment: "Services Patient Support"),
        NSLocalizedString("-Work with a Care Coordinators and learn how to manage chronic health concerns, and take steps to improve your health Care Coordinators and learn how to manage chronic health concerns, and take steps to improve your health Care Coordinators and learn how to manage chronic health concerns, and take steps to improve your health Care Coordinators and learn how to manage chronic health concerns, and take steps to improve your health", comment: "Services Patient Support"),
        NSLocalizedString("-Are patient advocates and your navigator through the healthcare system", comment: "Services Patient Support")]
    let primcare1 = [
        NSLocalizedString("•Acute Illness", comment: "Services Primary Care"),
        NSLocalizedString("•Chronic Disease Care", comment: "Services Primary Care"),
        NSLocalizedString("•CDL Exam", comment: "Services Primary Care"),
        NSLocalizedString("•Family Planning", comment: "Services Primary Care"),
        NSLocalizedString("•Geriatric Care", comment: "Services Primary Care"),
        NSLocalizedString("•Immunizations", comment: "Services Primary Care"),
        NSLocalizedString("•Laboratory Services", comment: "Services Primary Care"),
        NSLocalizedString("•Men's Health", comment: "Services Primary Care"),
        NSLocalizedString("•Minor Surgery", comment: "Services Primary Care"),
        NSLocalizedString("•Nutritional Counseling", comment: "Services Primary Care"),
        NSLocalizedString("•Physical Exam", comment: "Services Primary Care"),
        NSLocalizedString("•Preventive Care", comment: "Services Primary Care"),
        NSLocalizedString("•Well Child Visits", comment: "Services Primary Care"),
        NSLocalizedString("•Women's Health", comment: "Services Primary Care")]
    let primcare2 = [
        NSLocalizedString("•Acute Illness", comment: "Services Primary Care"),
        NSLocalizedString("•Chronic Disease Care", comment: "Services Primary Care"),
        NSLocalizedString("•Colposcopy", comment: "Services Primary Care"),
        NSLocalizedString("•CDL Exam", comment: "Services Primary Care"),
        NSLocalizedString("•Family Planning", comment: "Services Primary Care"),
        NSLocalizedString("•Geriatric Care", comment: "Services Primary Care"),
        NSLocalizedString("•Immunizations", comment: "Services Primary Care"),
        NSLocalizedString("•Labor and Delivery", comment: "Services Primary Care"),
        NSLocalizedString("•Laboratory Services", comment: "Services Primary Care"),
        NSLocalizedString("•Men's Health", comment: "Services Primary Care"),
        NSLocalizedString("•Minor Surgery", comment: "Services Primary Care"),
        NSLocalizedString("•Nutritional Counseling", comment: "Services Primary Care"),
        NSLocalizedString("•Pregnancy Care", comment: "Services Primary Care"),
        NSLocalizedString("•Preventive Care", comment: "Services Primary Care"),
        NSLocalizedString("•Physical Exam", comment: "Services Primary Care"),
        NSLocalizedString("•Well Child Visits", comment: "Services Primary Care"),
        NSLocalizedString("•Women's Health", comment: "Services Primary Care"),
        NSLocalizedString("•Vasectomy", comment: "Services Primary Care")]
    var servicesList = [String]()
    var dataSegue = ["", "", "", ""]
    // MARK: Strings
    let cellReuseIdentifier = "cell"
   
    // MARK: - View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set location and services text
        locationLabel.text = dataSegue[0]
        servicesLabel.text = dataSegue[1]
        
        // Set servicesList based on users location
        if(dataSegue[3] == "1"){
            servicesList = bhServices
        }else if(dataSegue[3] == "2"){
            servicesList = dentalServices
        }else if(dataSegue[3] == "3"){
            servicesList = patsupportServices
        }else if(dataSegue[3] == "4"){
            if(dataSegue[2] == "5"){
                servicesList = primcare2
            }else{
                servicesList = primcare1
            }
        }
        
        // Register the table view cell class and its reuse id
        self.servicesTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // Connect data to services table
        servicesTable.delegate = self
        servicesTable.dataSource = self
        
        // Used for variable row height
        servicesTable.estimatedRowHeight = 44.0
        servicesTable.rowHeight = UITableViewAutomaticDimension
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
    
    // MARK: - Navigation Buttons -
    @IBAction func cancelButtonTap(_ sender: AnyObject) {
         self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table Setup -
    // Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.servicesList.count
    }
    // Cell create
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
}
