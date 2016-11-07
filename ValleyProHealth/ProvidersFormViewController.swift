//
//  ProvidersFormViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/14/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit


class ProvidersFormViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets -
    // MARK: Buttons
    @IBOutlet weak var cancelButton: UIButton!
    // MARK: Labels
    @IBOutlet weak var providerType: UILabel!
    @IBOutlet weak var providerLocation: UILabel!
     @IBOutlet weak var titleLabel: UILabel!
    // MARK: TableViews
    @IBOutlet weak var providersTable: UITableView!
    
    // MARK: - Global Variables -
    // MARK: Arrays
    var dataSegue = ["","","",""]
    var dental_bloom = ["Dr. Dane Mishler, DDS"]
    var bh_bloom = ["Dr. Paul Taraska, MD", "Megan Neitling, LMHCA"]
    var med_bloom = ["Christi Busenbark, FNP-C", "Louwanna Wallace, FNP-C"]
    var dental_cay = ["Dr. Nichole Barnett, DDS"]
    var bh_cay = ["Johnathan Detwiler, MS", "Lisa Tincher, PMHNP"]
    var med_cay = ["Dr. Bing Gale, MD","Renae Norman, FNP-C"]
    var dental_clint = ["Currently none at this location"]
    var bh_clint = ["Dr. Paul Taraska, MD", "Dr. Julia Wernz, PhD, HSPP", "Michelle Bond, LMHCA", "Linda Lonneman, LCSW", "David McIntyre, LCAC", "Lisa Tincher, PMHNP"]
    var med_clint = ["Dr. Aziz Abed, MD", "Dr. Bing Gale, MD", "Dr. Steven Macke, MD", "Gretchen Blevins, FNP-C", "Nicole Hall, FNP-C", "Brandi Larson, FNP-C", "Tammy Mundy, FNP-C"]
    var dental_craw = ["Currently none at this location"]
    var bh_craw = ["Dr. Paul Taraska, MD", "Keith Seegers, LCSW", "Dana Tinkle, LMHC"]
    var med_craw = ["Dr. Do S. Hwang, MD", "Gwyndolen Morson, FNP-C"]
    var dental_terre = ["Currently none at this location"]
    var bh_terre = ["Sara Ritter, LCSW", "Lacey Skwortz, LCSW", "Lisa Tincher, PMHNP"]
    var med_terre = ["Leslie Batty, FNP-C","Beth Fields, FNP-C"]
    var dental_msbhc = ["Currently none at this location"]
    var bh_msbhc = ["Heather Woods, LMHCA"]
    var med_msbhc = ["Nicole Cook, FNP-C", "Renae Norman, FNP-C"]
    var providersList = [String]()
    // MARK: Defaults
    let defaults = UserDefaults.standard
    // MARK: Strings
    let cellReuseIdentifier = "cell"
   
    // MARk: - View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set provider type and location text
        providerType.text = dataSegue[1]
        providerLocation.text = dataSegue[0]
      
        // Set providerList based on users location and provider type choice
        if(dataSegue[3] == "1"){
            if(dataSegue[2] == "1"){
                providersList = bh_bloom
            }else if(dataSegue[2] == "2"){
                providersList = bh_cay
            }else if(dataSegue[2] == "3"){
                providersList = bh_clint
            }else if(dataSegue[2] == "4"){
                providersList = bh_craw
            }else if(dataSegue[2] == "5"){
                providersList = bh_terre
            }else if(dataSegue[2] == "6"){
                providersList = bh_msbhc
            }
        }else if(dataSegue[3] == "2"){
            if(dataSegue[2] == "1"){
                providersList = dental_bloom
            }else if(dataSegue[2] == "2"){
                providersList = dental_cay
            }else if(dataSegue[2] == "3"){
                providersList = med_clint
            }else if(dataSegue[2] == "4"){
                providersList = med_craw
            }else if(dataSegue[2] == "5"){
                providersList = med_terre
            }else if(dataSegue[2] == "6"){
                providersList = med_msbhc
            }
        }else if(dataSegue[3] == "3"){
            if(dataSegue[2] == "1"){
                providersList = med_bloom
            }else if(dataSegue[2] == "2"){
                providersList = med_cay
            }
        }
        
        // Register the table view cell class and its reuse id
        self.providersTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // Connect the data to providersTable
        providersTable.delegate = self
        providersTable.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        //Shrinks some text size for Spanish locale
        if(defaults.object(forKey:"savedLocale") as! String == "es"){
            titleLabel?.font = UIFont(name: (titleLabel?.font.fontName)!, size:20)
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
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation Buttons -
    @IBAction func cancelButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table Setup -
    // Number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.providersList.count
    }
    // Cell create
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.providersTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = self.providersList[(indexPath as NSIndexPath).row]
        cell.textLabel?.textAlignment = .center
        
        return cell
    }
}
