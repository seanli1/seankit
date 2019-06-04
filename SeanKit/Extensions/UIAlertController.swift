//
//  UIAlertController.swift
//  SeanKit
//
//  Created by Sean Li on 6/4/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import UIKit

public extension UIAlertController {
    
    /// Shortcut to adding a UIAlertAction with `.cancel` style.
    func addCancel(title: String?, handler: ((UIAlertAction) -> Void)?) {
        self.addAction(title: title, style: .cancel, handler: handler)
    }
    
    /// Shortcut to adding a UIAlertAction.
    func addAction(title: String?, style: UIAlertAction.Style, handler:((UIAlertAction) -> Void)?) {
        self.addAction(UIAlertAction(title: title, style: style, handler: handler))
    }
    
    /// Shortcut to adding a default "Ok" UIAlertAction button.
    func addOk(handler: ((UIAlertAction) -> Void)?) {
        self.addAction(title: "Ok", style: .default, handler: handler)
    }
    
}

