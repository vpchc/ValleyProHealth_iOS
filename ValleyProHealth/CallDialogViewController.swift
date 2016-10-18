//
//  CallDialogViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/12/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class CallDialogViewController: UIViewController {
 
    //MARK: Buttons
    @IBOutlet weak var bloomButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var cayButton: UIButton!
    @IBOutlet weak var clintButton: UIButton!
    @IBOutlet weak var crawButton: UIButton!
    @IBOutlet weak var terreButton: UIButton!
    @IBOutlet weak var msbhcButton: UIButton!
    
    //MARK: Strings
    let toastCallBloom = NSLocalizedString("Calling Bloomingdale Location...", comment: "Toast when calling Bloomingdale location")
    let toastCallCay = NSLocalizedString("Calling Cayuga Location...", comment: "Toast when calling Cayuga location")
    let toastCallClint = NSLocalizedString("Calling Clinton Location...", comment: "Toast when calling Clinton location")
    let toastCallCraw = NSLocalizedString("Calling Crawfordsville Location...", comment: "Toast when calling Crawfordsville location")
    let toastCallTerre = NSLocalizedString("Calling Terre Haute Location...", comment: "Toast when calling Terre Haute location")
    let toastCallMSBHC = NSLocalizedString("Calling MSBHC Location...", comment: "Toast when calling MSBHC location")
    
    //MARK: View Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Decision Buttons
    @IBAction func cancelButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: Call Button Taps
    @IBAction func bloomButtonTap(_ sender: AnyObject) {
        self.view.makeToast(toastCallBloom)
        let telenumber:URL = URL(string: "tel://7654989000")!
        UIApplication.shared.openURL(telenumber)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cayButtonTap(_ sender: AnyObject) {
        self.view.makeToast(toastCallCay)
        let telenumber:URL = URL(string: "tel://7654989042")!
        UIApplication.shared.openURL(telenumber)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func clintButtonTap(_ sender: AnyObject) {
        self.view.makeToast(toastCallClint)
        let telenumber:URL = URL(string: "tel://7658281003")!
        UIApplication.shared.openURL(telenumber)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func crawButton(_ sender: AnyObject) {
        self.view.makeToast(toastCallCraw)
        let telenumber:URL = URL(string: "tel://7653625100")!
        UIApplication.shared.openURL(telenumber)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func terreButtonTap(_ sender: AnyObject) {
        self.view.makeToast(toastCallTerre)
        let telenumber:URL = URL(string: "tel://8122387631")!
        UIApplication.shared.openURL(telenumber)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func msbhcButtonTap(_ sender: AnyObject) {
        self.view.makeToast(toastCallMSBHC)
        let telenumber:URL = URL(string: "tel://7655926164")!
        UIApplication.shared.openURL(telenumber)
        self.dismiss(animated: true, completion: nil)
    }

}
