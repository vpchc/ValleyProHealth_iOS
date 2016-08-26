//
//  ViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 7/21/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var callButton: UIButton!
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
        // Do any additional setup after loading the view, typically from a nib.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //The following is for dealing with when a user holds or releases a button on the main screen.
    //Call
    @IBAction func callButtonTap(sender: AnyObject) {
        let callImageOn = UIImage(named: "call_on.png") as UIImage!
        self.callButton.setImage(callImageOn, forState: UIControlState.Highlighted)
    }
    @IBAction func callButtonTapOff(sender: AnyObject) {
        print("Imma tapping out")
    }
    @IBAction func callButtonTapLeave(sender: AnyObject) {
        let callImageOff = UIImage(named: "call_off.png") as UIImage!
        self.callButton.setImage(callImageOff, forState: UIControlState.Normal)
    }
    
    //Providers
    @IBAction func providersButtonTapOn(sender: AnyObject) {
        let providersImageOn = UIImage(named: "providers_on.png") as UIImage!
        self.providersButton.setImage(providersImageOn, forState: UIControlState.Highlighted)
    }
    @IBAction func providersButtonTapOff(sender: AnyObject) {
        let providersImageOff = UIImage(named: "providers_off.png") as UIImage!
        self.providersButton.setImage(providersImageOff, forState: UIControlState.Normal)
    }
    //Locations
    @IBAction func locationsButtonTapOn(sender: AnyObject) {
        let locationsImageOn = UIImage(named: "locations_on.png") as UIImage!
        self.locationsButton.setImage(locationsImageOn, forState: UIControlState.Highlighted)
    }
    @IBAction func locationsButtonTapOff(sender: AnyObject) {

    }
    //Forms
    @IBAction func formsButtonTapOn(sender: AnyObject) {
        let formsImageOn = UIImage(named: "forms_on.png") as UIImage!
        self.formsButton.setImage(formsImageOn, forState: UIControlState.Highlighted)
    }
    @IBAction func formsButtonTapOff(sender: AnyObject) {
      
    }
    //Services
    @IBAction func servicesButtonTapOn(sender: AnyObject) {
        let servicesImageOn = UIImage(named: "services_on.png") as UIImage!
        self.servicesButton.setImage(servicesImageOn, forState: UIControlState.Highlighted)
    }
    @IBAction func servicesButtonTapOff(sender: AnyObject) {
      
    }
    //Tracker
    @IBAction func trackerButtonTapOn(sender: AnyObject) {
        let trackerImageOn = UIImage(named: "tracker_on.png") as UIImage!
        self.trackerButton.setImage(trackerImageOn, forState: UIControlState.Highlighted)
    }
    @IBAction func trackerButtonTapOff(sender: AnyObject) {
     
    }
    //Portal
    @IBAction func portalButtonTapOn(sender: AnyObject) {
        let portalImageOn = UIImage(named: "portal_on.png") as UIImage!
        self.portalButton.setImage(portalImageOn, forState: UIControlState.Highlighted)
    }
    @IBAction func portalButtonTapOff(sender: AnyObject) {
        let portalUrl: NSURL = NSURL(string:"https://secure2.myunionportal.org/vpchc/default.aspx")!
        let application = UIApplication.sharedApplication()
        
        application.openURL(portalUrl)
    }
    //Facebook
    @IBAction func facebookButtonTapOn(sender: AnyObject) {
        let facebookImageOn = UIImage(named: "facebook_on.png") as UIImage!
        self.facebookButton.setImage(facebookImageOn, forState: UIControlState.Highlighted)
    }
    @IBAction func facebookButtonTapOff(sender: AnyObject) {
        let application = UIApplication.sharedApplication()
        
        let facebookApp: NSURL = NSURL(string:"fb://profile/132585333458352")!
        let facebookUrl: NSURL = NSURL(string:"http://www.facebook.com/132585333458352")!
        
        //Open the facebook app to the vpchc profile is the app is available, otherwise open in the browser
        if application.canOpenURL(facebookApp) {
            application.openURL(facebookApp)
        } else {
            application.openURL(facebookUrl)
        }
    }
    //Website
    @IBAction func websiteButtonTapOn(sender: AnyObject) {
        let websiteImageOn = UIImage(named: "website_on.png") as UIImage!
        self.websiteButton.setImage(websiteImageOn, forState: UIControlState.Highlighted)
    }
    @IBAction func websiteButtonTapOff(sender: AnyObject) {
        let websiteUrl: NSURL = NSURL(string:"https://valleyprohealth.org")!
        let application = UIApplication.sharedApplication()
        
        application.openURL(websiteUrl)
    
    }
    
    
}

