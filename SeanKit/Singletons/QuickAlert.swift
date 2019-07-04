//
//  genericAlert.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

/// Singleton for convenient Alert functions in SeanKit.
public class QuickAlert {

    private init () {}
    
    /// Plays `alert` style alert controller with an Ok button.
    public static func ok(_ title: String?, _ message: String?, _ viewController: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        viewController.present(alert)
    }
    
}
