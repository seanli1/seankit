//
//  UIAlertController.swift
//  SeanKit
//
//  Created by Sean Li on 6/4/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import UIKit

public extension UIAlertController {
    
    /// Shortcut to adding a "Cancel" button. Enter custom text or set to `nil` to use default text.
    func skAddCancel(_ customText: String? = nil, handler: ((UIAlertAction) -> Void)? = nil) {
        self.skAddAction(customText ?? "Cancel", .cancel, handler: handler)
    }
    
    /// Shortcut to adding a UIAlertAction.
    func skAddAction(_ title: String, _ style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)?) {
        self.addAction(UIAlertAction(title: title, style: style, handler: handler))
    }
    
    /// Shortcut to adding an "Ok" button. Enter custom text or set to `nil` to use default text.
    func skAddOk(_ customText: String? = nil, handler: ((UIAlertAction) -> Void)? = nil) {
        self.skAddAction(customText ?? "Ok", .default, handler: handler)
    }
    
}

