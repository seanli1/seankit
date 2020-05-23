//
//  SKDevice.swift
//  SeanKit
//
//  Created by Sean Li on 5/22/20.
//  Copyright © 2020 86 Houses LLC. All rights reserved.
//

import UIKit


public class SKDevice {
    
    private init() {}
    
    @available(iOS 13, *)
    /// Returns `dark`, `light`, or `unspecified`.
    public static func style() -> UIUserInterfaceStyle {
        return UITraitCollection.current.userInterfaceStyle
    }
    
    /// Returns the type of device.
    public static func idiom() -> UIUserInterfaceIdiom {
        return UIDevice.current.userInterfaceIdiom
    }
    
}
