//
//  ProvidersFormViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/14/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit


class ProvidersFormViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var providerType: UILabel!
    @IBOutlet weak var providerLocation: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var providersTable: UITableView!
    
    
    
    let cellReuseIdentifier = "cell"
    
    var dataSegue = ["","","",""]
    
    var dental_bloom = ["Dr. Dane Mishler, DDS"]
    var bh_bloom = ["Dr. Paul Taraska, MD", "Michelle Bond, LMHCA"]
    var med_bloom = ["Christi Busenbark, FNP-C","Tammi Mundy, FNP-C","Louwanna Wallace, FNP-C"]
    
    var dental_cay = ["Dr. Nichole Barnett, DDS"]
    var bh_cay = ["Dr. Paul Taraska, MD", "Johnathan Detwiler, MS"]
    var med_cay = ["Dr. Bing Gale, MD","Renae Norman, FNP-C"]
    
    var dental_clint = ["Currently none at this location"]
    var bh_clint = ["Dr. Paul Taraska, MD", "Dr. Julia Wernz, PhD, HSPP", "Michelle Bond, LMHCA", "Linda Lonneman, LCSW", "David McIntyre, LCAC", "Heather Woods, LMHCA"]
    var med_clint = ["Dr. Aziz Abed, MD", "Dr. Bing Gale, MD", "Dr. Steven Macke, MD", "Gretchen Blevins, FNP-C", "Nicole Cook, FNP-C", "Nichole Hall, FNP-C", "Tammi Mundy, FNP-C"]
    
    var dental_craw = ["Currently none at this location"]
    var bh_craw = ["Dr. Paul Taraska, MD", "Keith Seegers, LCSW", "Dana Tinkle, LMHCA"]
    var med_craw = ["Dr. James Buechler, MD", "Dr. Do S. Hwang, MD", "Gwyndolen Morson, FNP-C"]
    
    var dental_terre = ["Currently none at this location"]
    var bh_terre = ["Dr. Paul Taraska, MD", "Sara Ritter, LCSW", "Lacey Skwortz, LCSW"]
    var med_terre = ["Leslie Batty, FNP-C","Beth Fields, FNP-C"]
    
    var dental_msbhc = ["Currently none at this location"]
    var bh_msbhc = ["Dr. Paul Taraska, MD", "Heather Woods, LMHCA"]
    var med_msbhc = ["Nicole Hall, FNP-C", "Renae Norman, FNP-C"]

    var providersList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        providerType.text = dataSegue[1]
        providerLocation.text = dataSegue[0]
        
        var number: CGFloat = 0
        
        var providerLength = 0
      
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
        
        
        providerLength = providersList.count
        
        // Register the table view cell class and its reuse id
        self.providersTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        // This view controller itself will provide the delegate methods and row data for the table view.
        providersTable.delegate = self
        providersTable.dataSource = self
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
        return self.providersList.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = self.providersTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        // set the text from the data model
        cell.textLabel?.text = self.providersList[(indexPath as NSIndexPath).row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.font = UIFont(name: (cell.textLabel?.font.fontName)!, size:25)
        
        return cell
    }
}
