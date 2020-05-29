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
    func skPresentMailController(_ delegate: MFMailComposeViewControllerDelegate, to recipients: [String]?, sub subject: String?, body: String?, isHtml: Bool, showPopupIfUnable show: Bool) {
        if MFMailComposeViewController.canSendMail() {
            let mailController = MFMailComposeViewController()
            mailController.setToRecipients(recipients)
            mailController.setSubject(subject ?? "")
            mailController.setMessageBody(body ?? "", isHTML: isHtml)
            mailController.mailComposeDelegate = delegate
            skPresent(mailController)
        } else {
            if show {
                let alert = UIAlertController(title: "Can't Send Email", message: "Cannot reach the Mail app to send email.", preferredStyle: .alert)
                alert.skAddAction("Ok", .default, handler: nil)
                self.skPresent(alert)
            } else {
                print("This device is not configured to send email.")
            }
        }
    }
    
    /// Present an alert with an "Ok" button only. Set `customButtonText` to text for the button, otherwise set to `nil` to use default "Ok" text.
    func skPresentOkAlert(_ title: String?, message: String?, _ style: UIAlertController.Style = .alert, _ customButtonText: String? = nil, okPressedAction: ((UIAlertAction) -> Void)? = nil) {
        var alert: UIAlertController
        switch style {
        case .actionSheet:
            alert = Skit.dynamicSheet(title: title, message: message)
        default:
            alert = UIAlertController(title: title, message: message, preferredStyle: style)
        }
        alert.skAddOk(customButtonText, handler: okPressedAction)
        skPresent(alert)
    }
    
    /// Present a view controller animated with no completion by default.
    func skPresent(_ viewControllerToPresent: UIViewController, animated: Bool = true, completion: (()->())? = nil) {
        present(viewControllerToPresent, animated: animated, completion: completion)
    }
    
}
