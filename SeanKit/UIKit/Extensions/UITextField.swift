//
//  UITextField.swift
//  SeanKit
//
//  Created by Sean Li on 6/17/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import UIKit


public extension UITextField {
    
    /// Add a toolbar to the keyboard with a `Done` button on the right side.
    func skAddDoneButton(_ style: UIBarStyle = .default) {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(skDoneButtonPressed))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        toolbar.barStyle = style
        if style == .black || style == .blackTranslucent || style == .blackOpaque {
            toolbar.tintColor = UIColor.white
        }
        toolbar.items = [space, doneButton]
        inputAccessoryView = toolbar
    }
    
    @objc private func skDoneButtonPressed() {
        resignFirstResponder()
    }
    
    /// Returns `true` if text is blank after removing white spaces and returns.
    var skIsBlank: Bool {
        return self.text == nil || self.text?.count == 0 || self.text?.replacingOccurrences(of: "\n", with: "").count == 0 || self.text?.replacingOccurrences(of: " ", with: "").count == 0
    }
    
}
