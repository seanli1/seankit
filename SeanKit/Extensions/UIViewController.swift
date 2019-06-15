//
//  UIViewController.swift
//  SeanKit
//
//  Created by Sean Li on 6/4/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import MessageUI
import UIKit

public extension UIViewController {
    
    /// Presents a configured mail controller. If device isn't configured to send email, decide whether to show popup to user.
    func presentMailController(_ delegate: MFMailComposeViewControllerDelegate, to recipients: [String]?, sub subject: String?, body: String?, isHtml: Bool, showPopupIfUnable show: Bool) {
        if MFMailComposeViewController.canSendMail() {
            let mailController = MFMailComposeViewController()
            mailController.setToRecipients(recipients)
            mailController.setSubject(subject ?? "")
            mailController.setMessageBody(body ?? "", isHTML: isHtml)
            mailController.mailComposeDelegate = delegate
            present(mailController, animated: true, completion: nil)
        } else {
            if show {
                let alert = UIAlertController(title: "Can't Send Email", message: "This device is not configured to send email.", preferredStyle: .alert)
                alert.addAction(title: "Ok", style: .default, handler: nil)
                self.present(alert, animated: true, completion: nil)
            } else {
                print("This device is not configured to send email.")
            }
        }
    }
    
    /// Present an alert that has an Ok button.
    func presentOkAlert(title: String?, message: String?, style: UIAlertController.Style, okPressedAction: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.addOk(handler: okPressedAction)
        present(alert, animated: true, completion: nil)
    }
    
}
