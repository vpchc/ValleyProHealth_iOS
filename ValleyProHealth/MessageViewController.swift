//
//  MessageViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 10/11/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit
import MessageUI

class MessageViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var subjectField: UITextField!
    @IBOutlet weak var messageField: UITextView!
    
    let messageErrorTitle = NSLocalizedString("Could Not Send Email", comment: "Message Error Text")
    let messageErrorBody = NSLocalizedString("Your device could not send e-mail.  Please check e-mail configuration and try again.", comment: "Message Error Text")
    
    
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

    
    @IBAction func sendButtonTap(_ sender: AnyObject) {
        let mailComposeViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            self.showSendMailErrorAlert()
        }
        
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients(["iosfeedback@vpchc.org"])
        mailComposerVC.setSubject(subjectField.text!)
        mailComposerVC.setMessageBody(messageField.text!, isHTML: false)
        
        return mailComposerVC
    }
    
    func showSendMailErrorAlert() {
        let sendMailErrorAlert = UIAlertView(title: messageErrorTitle , message: messageErrorBody, delegate: self, cancelButtonTitle: "OK")
        sendMailErrorAlert.show()
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
    }

}
