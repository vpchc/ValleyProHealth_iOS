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
    
    var dataSegue = ["",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        providerTypeLabel.text = dataSegue[0]
        providerLocationLabel.text = dataSegue[1]
        
    }
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func closeButtonTap(sender: AnyObject) {
         self.dismissViewControllerAnimated(true, completion: nil)
    }
}
