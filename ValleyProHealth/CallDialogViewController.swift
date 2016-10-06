//
//  CallDialogViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 9/12/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class CallDialogViewController: UIViewController {
 
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var bloomButton: UIButton!
    @IBOutlet weak var cayButton: UIButton!
    @IBOutlet weak var clintButton: UIButton!
    @IBOutlet weak var crawButton: UIButton!
    @IBOutlet weak var terreButton: UIButton!
    @IBOutlet weak var msbhcButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func bloomButtonTap(_ sender: AnyObject) {
        self.view.makeToast("Calling Bloomingdale Location...")
        let telenumber:URL = URL(string: "tel://7654989000")!
        UIApplication.shared.openURL(telenumber)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func cayButtonTap(_ sender: AnyObject) {
        self.view.makeToast("Calling Cayuga Location...")
        let telenumber:URL = URL(string: "tel://7654989042")!
        UIApplication.shared.openURL(telenumber)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func clintButtonTap(_ sender: AnyObject) {
        self.view.makeToast("Calling Clinton Location...")
        let telenumber:URL = URL(string: "tel://7658281003")!
        UIApplication.shared.openURL(telenumber)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func crawButton(_ sender: AnyObject) {
        self.view.makeToast("Calling Crawfordsville Location...")
        let telenumber:URL = URL(string: "tel://7653625100")!
        UIApplication.shared.openURL(telenumber)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func terreButtonTap(_ sender: AnyObject) {
        self.view.makeToast("Calling Terre Haute Location...")
        let telenumber:URL = URL(string: "tel://8122387631")!
        UIApplication.shared.openURL(telenumber)
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func msbhcButtonTap(_ sender: AnyObject) {
        self.view.makeToast("Calling MSBHC...")
        let telenumber:URL = URL(string: "tel://7655926164")!
        UIApplication.shared.openURL(telenumber)
        self.dismiss(animated: true, completion: nil)
    }

}
