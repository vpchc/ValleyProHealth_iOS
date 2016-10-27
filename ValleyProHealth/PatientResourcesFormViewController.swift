//
//  PatientResourcesFormViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/21/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class PatientResourcesFormViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resourceTable: UITableView!
    
    let defaults = UserDefaults.standard
    
    var diabetesResource = [
        NSLocalizedString("Valley Professionals holds monthly Diabetes Support Group meetings that are completely free and open to anyone who is affected by Diabetes, even if you are not a patient with Valley Professionals. For more information visit valleyprohealth.org/diabetes", comment: "Patient Resources Diabetes")]
    var prescriptResource = [
        NSLocalizedString("We have several ways to help patients that are having trouble affording their medication.", comment: "Patient Resources Prescriptions Assistance"),
        NSLocalizedString("340B Program: This program helps cover the cost of many precscription medications. Based on your family income and size determines how much you have to pay for your medications. Application for the sliding fee scale is required for this program. If you qualify, medications may be free or low cost.", comment: "Patient Resources Prescriptions Assistance "),
        NSLocalizedString("Drug Companies: Many of commonly prescribed drugs can be obtained through drug companies at no cost or low cost. Our Community Health Workers can assist in these applications.", comment: "Patient Resources Prescriptions Assistance"),
        NSLocalizedString("Good Rx: The website goodrx.com has comparison shopping on prescriptions and offer many good coupons.", comment: "Patient Resources Prescriptions Assistance"),
        NSLocalizedString("Additional programs are also available such as discount drug cards and the Freestyle Promise Program.", comment: "Patient Resources Prescriptions Assistance")]
    var scaleResource = [
        NSLocalizedString("If patients are not covered by any type of medical insurance for their medical needs, a sliding fee scale is available for patients to receive a discounted rate. Discounts available are based on patient family size and income in accordance with the most recent U.S. Department of Health and Human Services Federal Poverty Guidelines.", comment: "Patient Resources Sliding Fee Scale"),
        NSLocalizedString("The sliding fee scale is based upon the current income of all family members, and the number of people in the household. An individual who is unemployed, has no income and is being supported by others must provide documentation showing that no federal income taxes have been filed, and the person supporting the patient must provide written and signed documentation that they are providing food and shelter for the patient.", comment: "Patient Resources Sliding Fee Scale"),
        NSLocalizedString("In order to qualify for the sliding fee scale at VPCHC, patients and their families must have a combined income that falls within the U.S. Federal Poverty Guidelines.", comment: "Patient Resources Sliding Fee Scale")]
    
    
    var dataSegue = ["", ""]
    var resourceList = [String]()
    let cellReuseIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryLabel.text = dataSegue[0]
        
        
        if(dataSegue[1] == "1"){
            resourceList = diabetesResource
        }else if(dataSegue[1] == "2"){
            resourceList = prescriptResource
        }else if(dataSegue[1] == "3"){
            resourceList = scaleResource
        }
        self.resourceTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        resourceTable.delegate = self
        resourceTable.dataSource = self
        
        resourceTable.estimatedRowHeight = 44.0
        resourceTable.rowHeight = UITableViewAutomaticDimension
    }
    override func viewWillAppear(_ animated: Bool) {
        if(defaults.object(forKey:"savedLocale") as! String == "es"){
            titleLabel?.font = UIFont(name: (titleLabel?.font.fontName)!, size:21)
            categoryLabel?.font = UIFont(name: (categoryLabel?.font.fontName)!, size:22)
        }
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
        return self.resourceList.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.resourceTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        cell.textLabel?.text = self.resourceList[(indexPath as NSIndexPath).row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20.0)
        
        //Used to wrap the words
        cell.textLabel?.numberOfLines = 0
        return cell
    }

}
