//
//  MailView.swift
//  AteBall
//
//  Created by Sean Li on 5/16/20.
//  Copyright © 2020 Sean Li. All rights reserved.
//

import SwiftUI
import UIKit
import MessageUI

@available(iOS 13, *)
public struct SKMailView: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentation
    @Binding var result: Result<MFMailComposeResult, Error>?
    let recipients: [String]
    let subject: String
    let body: String
    let bodyIsHTML: Bool
    
    public static let cannotSendMailAlert = Alert(title: Text("Can't Send Email"), message: Text("Sorry, this device isn't configured to send email. Make sure you have the Mail app installed."), dismissButton: .default(Text("Ok")))
    
    public init(to recipients: [String], subject: String, body: String, bodyIsHTML: Bool, result: Binding<Result<MFMailComposeResult, Error>?>) {
        self.recipients = recipients
        self.subject = subject
        self.body = body
        self.bodyIsHTML = bodyIsHTML
        self._result = result
    }
    
    public class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        
        @Binding var presentation: PresentationMode
        @Binding var result: Result<MFMailComposeResult, Error>?
        
        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }
        
        public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            guard error == nil else {
                self.result = .failure(error!)
                return
            }
            self.result = .success(result)
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(presentation: presentation, result: $result)
    }
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<SKMailView>) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setToRecipients(recipients)
        vc.setSubject(subject)
        vc.setMessageBody(body, isHTML: bodyIsHTML)
        return vc
    }
    
    public func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: UIViewControllerRepresentableContext<SKMailView>) {
        
    }
}
