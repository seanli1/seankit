//
//  topController.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

public extension Skit {
    
    /// Get the top `UIViewController` in a navigation stack.
    static func topController() -> UIViewController? {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedController = topController.presentedViewController {
                topController = presentedController
            }
            return topController
        } else {
            return nil
        }
    }
    
}
