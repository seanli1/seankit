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
    
    /// Returns 'true' if the current device has a notch
    public static var hasNotch: Bool {
        if #available(iOS 11.0, *) {
            // Case 1: Portrait && top safe area inset >= 44
            let case1 = !UIDevice.current.orientation.isLandscape && (UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0) >= 44
            // Case 2: Lanscape && left/right safe area inset > 0
            let case2 = UIDevice.current.orientation.isLandscape && ((UIApplication.shared.keyWindow?.safeAreaInsets.left ?? 0) > 0 || (UIApplication.shared.keyWindow?.safeAreaInsets.right ?? 0) > 0)
            
            return case1 || case2
        } else {
            // Fallback on earlier versions
            return false
        }
    }
}

public class SKScreen {
    private init() {}
    
    public static let width: CGFloat = UIScreen.main.bounds.width
    public static let height: CGFloat = UIScreen.main.bounds.height
    
}
