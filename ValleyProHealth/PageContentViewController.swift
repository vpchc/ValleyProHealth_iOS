//
//  PageContentViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/8/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {

    @IBOutlet weak var callbutton: UIButton!
    @IBOutlet weak var providersButton: UIButton!
    @IBOutlet weak var locationsButton: UIButton!
    @IBOutlet weak var formsButton: UIButton!
    @IBOutlet weak var servicesButton: UIButton!
    @IBOutlet weak var trackerButton: UIButton!
    @IBOutlet weak var portalButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func portalButtonTapOff(_ sender: AnyObject) {
        let portalUrl: URL = URL(string:"https://secure2.myunionportal.org/vpchc/default.aspx")!
        let application = UIApplication.shared
        
        self.view.makeToast("Opening VPCHC Patient Portal webpage…")
        application.openURL(portalUrl)
    }
  
    @IBAction func facebookButtonTapOff(_ sender: AnyObject) {
        let application = UIApplication.shared
        
        let facebookApp: URL = URL(string:"fb://profile/132585333458352")!
        let facebookUrl: URL = URL(string:"http://www.facebook.com/132585333458352")!
        
        //Open the facebook app to the vpchc profile is the app is available, otherwise open in the browser
        self.view.makeToast("Opening VPCHC Facebook page…")
        if application.canOpenURL(facebookApp) {
            application.openURL(facebookApp)
        } else {
            application.openURL(facebookUrl)
        }
    }
    
    @IBAction func websiteButtonTapOff(_ sender: AnyObject) {
        let websiteUrl: URL = URL(string:"https://valleyprohealth.org")!
        let application = UIApplication.shared
        
        self.view.makeToast("Opening VPCHC webpage…")
        application.openURL(websiteUrl)
    }

}
