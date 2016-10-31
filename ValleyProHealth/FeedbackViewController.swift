//
//  FeedbackViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/29/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit
import Toast_Swift

class FeedbackViewController: UIViewController {

    // MARK: - Outlets -
    // MARK: Buttons
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    
    // MARK: - Global Variables -
    // MARK: Strings
    let toastRate = "Opening App Store..."
    
    //MARK: View Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Navigation Buttons -
    @IBAction func cancelButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    //MARK: - Rate Button Tap -
    @IBAction func ratebuttonTap(_ sender: AnyObject) {
        self.view.makeToast(toastRate)
        
        //Open ValleyProHealth App Store Page
        let appPageURL: URL = URL(string:"https://itunes.apple.com/us/app/apple-store/valleyprohealth")!
        let application = UIApplication.shared
        application.openURL(appPageURL)
       
    }
}
