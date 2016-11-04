//
//  FeedbackViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 9/29/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit
import MessageUI
import Toast_Swift

class FeedbackViewController: UIViewController, MFMailComposeViewControllerDelegate {

    // MARK: - Outlets -
    // MARK: Buttons
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    
    // MARK: - Global Variables -
    // MARK: Strings
    let toastRate = "Opening App Store..."
    let messageErrorTitle = NSLocalizedString("Could Not Send Email", comment: "Message Error Text")
    let messageErrorBody = NSLocalizedString("Your device could not send e-mail.  Please check e-mail configuration and try again.", comment: "Message Error Text")
    
    // MARK: View Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Navigation Buttons -
    @IBAction func cancelButtonTap(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Button Taps -
    @IBAction func rateButtonTap(_ sender: AnyObject) {
        self.view.makeToast(toastRate)
        
        //Open ValleyProHealth App Store Page
        let appPageURL = URL(string:"itms-apps://itunes.apple.com/us/app/apple-store/1171455532")
        UIApplication.shared.openURL(appPageURL!)
       
    }
    @IBAction func messageButtonTap(_ sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
    }
    
    //MARK: - Mail Functions -
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["iosfeedback@vpchc.org"])
        
        return mailComposerVC
    }
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: messageErrorTitle , message: messageErrorBody, delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
}
