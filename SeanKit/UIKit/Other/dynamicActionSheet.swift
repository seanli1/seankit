//
//  DynamicActionSheet.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation


public extension Skit {
    
    /// Returns a `UIAlertController` that is `.alert` if it's an iPad, otherwise an `.actionSheet`.
    static func dynamicSheet(title: String? = nil, message: String? = nil) -> UIAlertController {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return UIAlertController(title: title, message: message, preferredStyle: .alert)
        } else {
            return UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        }
    }
    
}
