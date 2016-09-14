//
//  CallDialogViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/12/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class CallDialogViewController: UIViewController {
    @IBOutlet weak var bloomCallButton: UIButton!
    @IBOutlet weak var cayCallButton: UIButton!
    @IBOutlet weak var clintCallButton: UIButton!
    @IBOutlet weak var crawCallButton: UIButton!
    @IBOutlet weak var terreCallButton: UIButton!
    @IBOutlet weak var msbhcCallButton: UIButton!
    @IBOutlet weak var modalClose: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func bloomButtonTap(sender: AnyObject) {
        let telenumber:NSURL = NSURL(string: "tel://7654989000")!
        UIApplication.sharedApplication().openURL(telenumber)
        print("calling bloom")
    }
    @IBAction func cayButtonTap(sender: AnyObject) {
        let telenumber:NSURL = NSURL(string: "tel://7654989042")!
        UIApplication.sharedApplication().openURL(telenumber)
    }
    @IBAction func clintButtonTap(sender: AnyObject) {
        let telenumber:NSURL = NSURL(string: "tel://7658281003")!
        UIApplication.sharedApplication().openURL(telenumber)
    }
    @IBAction func crawButtonTap(sender: AnyObject) {
        let telenumber:NSURL = NSURL(string: "tel://7653625100")!
        UIApplication.sharedApplication().openURL(telenumber)
    }
    @IBAction func terreButtonTap(sender: AnyObject) {
        let telenumber:NSURL = NSURL(string: "tel://8122387631")!
        UIApplication.sharedApplication().openURL(telenumber)
    }
    @IBAction func msbhcButtonTap(sender: AnyObject) {
        let telenumber:NSURL = NSURL(string: "tel://7655926164")!
        UIApplication.sharedApplication().openURL(telenumber)
    }
    @IBAction func modalDismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
