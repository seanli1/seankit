//
//  UITextView.swift
//  SeanKit
//
//  Created by Sean Li on 6/16/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import UIKit

public extension UITextView {
    
    /// Add a toolbar to the keyboard with a `Done` button on the right side.
    func addDoneButton() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        toolbar.items = [space, doneButton]
        inputAccessoryView = toolbar
    }
    
    @objc private func doneButtonPressed() {
        resignFirstResponder()
    }
    
    
    var isBlank: Bool {
        return self.text == nil || self.text?.count == 0 || self.text?.replacingOccurrences(of: "\n", with: "").count == 0 || self.text?.replacingOccurrences(of: " ", with: "").count == 0
    }
    
}
