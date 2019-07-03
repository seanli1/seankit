//
//  DynamicActionSheet.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

/// Returns a `UIAlertController` that is either `.alert` or `.actionSheet` depending on if it's an iPad.
public func dynamicActionSheet(title: String?, message: String?) -> UIAlertController {
    if UI_USER_INTERFACE_IDIOM() == .pad {
        return UIAlertController(title: title, message: message, preferredStyle: .alert)
    } else {
        return UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
    }
}
