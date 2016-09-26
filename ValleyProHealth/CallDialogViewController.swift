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
    @IBAction func bloomButtonTap(_ sender: AnyObject) {
        let telenumber:URL = URL(string: "tel://7654989000")!
        UIApplication.shared.openURL(telenumber)
        print("calling bloom")
    }
    @IBAction func cayButtonTap(_ sender: AnyObject) {
        let telenumber:URL = URL(string: "tel://7654989042")!
        UIApplication.shared.openURL(telenumber)
    }
    @IBAction func clintButtonTap(_ sender: AnyObject) {
        let telenumber:URL = URL(string: "tel://7658281003")!
        UIApplication.shared.openURL(telenumber)
    }
    @IBAction func crawButtonTap(_ sender: AnyObject) {
        let telenumber:URL = URL(string: "tel://7653625100")!
        UIApplication.shared.openURL(telenumber)
    }
    @IBAction func terreButtonTap(_ sender: AnyObject) {
        let telenumber:URL = URL(string: "tel://8122387631")!
        UIApplication.shared.openURL(telenumber)
    }
    @IBAction func msbhcButtonTap(_ sender: AnyObject) {
        let telenumber:URL = URL(string: "tel://7655926164")!
        UIApplication.shared.openURL(telenumber)
    }
    @IBAction func modalDismiss(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
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
