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
    @IBOutlet weak var faqsButton: UIButton!
    @IBOutlet weak var patresButton: UIButton!
    @IBOutlet weak var portalButton: UIButton!
    @IBOutlet weak var facebookButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var websiteButton: UIButton!
    
    let toastOpenWebsite = NSLocalizedString("Opening VPCHC website…", comment: "Toast Main Open Website")
    let toastOpenFacebookPage = NSLocalizedString("Opening VPCHC Facebook Page…", comment: "Toast Main Open Facebook Page")
    let toastOpenPortal = NSLocalizedString("Opening VPCHC Patient Portal webpage…", comment: "Toast Main Open Portal")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func portalButtonTap(_ sender: AnyObject) {
        let portalUrl: URL = URL(string:"https://secure2.myunionportal.org/vpchc/default.aspx")!
        let application = UIApplication.shared
        
        self.view.makeToast(toastOpenPortal)
        application.openURL(portalUrl)
    }
  
    
    @IBAction func twitterButtonTap(_ sender: AnyObject) {
        let application = UIApplication.shared
        
        let twitterApp: URL = URL(string:"twitter:///user?screen_name=valleyprohealth")!
        let twitterUrl: URL = URL(string:"https://twitter.com/ValleyProHealth")!
        
        //Open the facebook app to the vpchc profile is the app is available, otherwise open in the browser
        self.view.makeToast("Opening VPCHC Twitter page…")
        if application.canOpenURL(twitterApp) {
            application.openURL(twitterApp)
        } else {
            application.openURL(twitterUrl)
        }
    }
    
    @IBAction func facebookButtonTap(_ sender: AnyObject) {
        let application = UIApplication.shared
        
        let facebookApp: URL = URL(string:"fb://profile/132585333458352")!
        let facebookUrl: URL = URL(string:"http://www.facebook.com/132585333458352")!
        
        //Open the facebook app to the vpchc profile is the app is available, otherwise open in the browser
        self.view.makeToast(toastOpenFacebookPage)
        if application.canOpenURL(facebookApp) {
            application.openURL(facebookApp)
        } else {
            application.openURL(facebookUrl)
        }
    }
    
    @IBAction func websiteButtonTap(_ sender: AnyObject) {
        let websiteUrl: URL = URL(string:"https://valleyprohealth.org")!
        let application = UIApplication.shared
        
        self.view.makeToast(toastOpenWebsite)
        application.openURL(websiteUrl)
    }

}
