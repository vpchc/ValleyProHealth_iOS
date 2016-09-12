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
    
    @IBAction func portalButtonTapOff(sender: AnyObject) {
        let portalUrl: NSURL = NSURL(string:"https://secure2.myunionportal.org/vpchc/default.aspx")!
        let application = UIApplication.sharedApplication()
        
        application.openURL(portalUrl)
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
    
    @IBAction func websiteButtonTapOff(sender: AnyObject) {
        let websiteUrl: NSURL = NSURL(string:"https://valleyprohealth.org")!
        let application = UIApplication.sharedApplication()
        
        application.openURL(websiteUrl)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
