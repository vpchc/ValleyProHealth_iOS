//
//  ServicesFormViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/18/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class ServicesFormViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var servicesLabel: UILabel!
    @IBOutlet weak var servicesScroll: UIScrollView!
    
    
    var bhServices = ["•Child/Adolescent counseling", "•Crisis counseling", "•Family counseling", "•Psychiatry", "•Testing/Assessment(upon referral)"]
    var dentalServices = ["•Preventive and restorative services"]
    var patsupportServices = ["•Community Health Workers","-Provide assistance navigating the Insurance Marketplace, Healthy Indiana Plan, and Medicaid applications", "-Educate patients on preventive healthcare behaviors", "-Help patients find necessities like food, clothes, and toiletries", "•Patient Care Coordinator", "-Work with a Care Coordinators and learn how to manage chronic health concerns, and take steps to improve your health", "-Are patient advocates and your navigator through the healthcare system"]
    var primcare1 = ["•Acute Illness", "•Chronic Disease Care", "•CDL Exam", "•Family Planning", "•Geriatric Care", "•Immunizations", "•Laboratory Services", "•Men's Health", "•Minor Surgery", "•Nutritional Counseling", "•Physical Exam", "•Preventive Care", "•Well Child Visits", "•Women's Health"]
    var primcare2 = ["•Acute Illness", "•Chronic Disease Care", "•Colposcopy", "•CDL Exam", "•Family Planning", "•Geriatric Care", "•Immunizations", "•Labor and Delivery", "•Laboratory Services", "•Men's Health", "•Minor Surgery", "•Nutritional Counseling", "•Pregnancy Care", "•Preventive Care", "•Physical Exam", "•Well Child Visits", "•Women's Health", "•Vasectomy"]
    var servicesList = [String]()
    var dataSegue = ["", "", "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationLabel.text = dataSegue[0]
        servicesLabel.text = dataSegue[1]
        
        var number: CGFloat = 0
        
        var servicesLength = 0
        
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
        
        servicesLength = servicesList.count
        
        for i in 0..<servicesLength
        {
            let label = UILabel(frame: CGRectMake(-10, number, servicesScroll.bounds.size.width - 42, 25))
            
            
            label.textAlignment = .Center
            label.font = UIFont(name: label.font.fontName, size: 25)
            label.text = servicesList[i]
            label.numberOfLines = 2
            self.servicesScroll.addSubview(label)
            number = number + 50
            
        }
        self.servicesScroll.contentSize = CGSizeMake(servicesScroll.bounds.size.width - 220, number);


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTap(sender: AnyObject) {
         self.dismissViewControllerAnimated(true, completion: nil)
    }

  
}
