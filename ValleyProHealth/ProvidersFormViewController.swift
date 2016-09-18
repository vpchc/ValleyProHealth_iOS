//
//  ProvidersFormViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/14/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class ProvidersFormViewController: UIViewController {
    
    @IBOutlet weak var providerTypeLabel: UILabel!
    @IBOutlet weak var providerLocationLabel: UILabel!
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var providerScroll: UIScrollView!
    
    var dataSegue = ["","","",""]
    
    var dental_bloom = ["Dr. Nels Ewoldsen, DDS", "Dr. Dane Mishler, DDS"]
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
        
        providerTypeLabel.text = dataSegue[0]
        providerLocationLabel.text = dataSegue[1]
        
        var number: CGFloat = 0
        
        var providerLength = 0
      
        if(dataSegue[3] == "1"){
            if(dataSegue[2] == "1"){
                providersList = bh_bloom
                print("made it")
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
                providersList = dental_clint
            }else if(dataSegue[2] == "4"){
                providersList = dental_craw
            }else if(dataSegue[2] == "5"){
                providersList = dental_terre
            }else if(dataSegue[2] == "6"){
                providersList = dental_msbhc
            }
        }else if(dataSegue[3] == "3"){
            if(dataSegue[2] == "1"){
                providersList = med_bloom
            }else if(dataSegue[2] == "2"){
                providersList = med_cay
            }else if(dataSegue[2] == "3"){
                providersList = med_clint
            }else if(dataSegue[2] == "4"){
                providersList = med_craw
            }else if(dataSegue[2] == "5"){
                providersList = med_terre
            }else if(dataSegue[2] == "6"){
                providersList = med_msbhc
            }
        }
        
        providerLength = providersList.count
        
        for i in 0..<providerLength
        {
            let label = UILabel(frame: CGRectMake(-10, number, providerScroll.bounds.size.width - 42, 25))
 
         
            label.textAlignment = .Center
            label.font = UIFont(name: label.font.fontName, size: 25)
            label.text = providersList[i]
            self.providerScroll.addSubview(label)
            number = number + 50
            
        }
        self.providerScroll.contentSize = CGSizeMake(providerScroll.bounds.size.width - 220, number);
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func closeButtonTap(sender: AnyObject) {
         self.dismissViewControllerAnimated(true, completion: nil)
    }
}
