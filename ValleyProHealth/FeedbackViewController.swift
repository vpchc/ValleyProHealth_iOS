//
//  FeedbackViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/29/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func ratebuttonTap(_ sender: AnyObject) {
        //Open valleyprohealth page in app store
    }
    @IBAction func messageButtonTap(_ sender: AnyObject) {
        
    }
   
}
