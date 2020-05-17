//
//  vibrate.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation
import AVFoundation

/// Singleton for convenient Vibrate functions in SeanKit.
public class SKVibrate {
    
    private init() {}
    
    /// Standard long buzz.
    public static func standard() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    /// Used to provide the "touch counterpart" to UI changes for look and feel.
    public static func touch(_ intensity: UIImpactFeedbackGenerator.FeedbackStyle) {
        UIImpactFeedbackGenerator(style: intensity).impactOccurred()
    }
    
    /// Used for selection haptic feedback (i.e. `UIPickerView` selection changes).
    public static func select() {
        UISelectionFeedbackGenerator().selectionChanged()
    }
    
    /// Used to notify the user of certain events occurring.
    public static func notify(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        UINotificationFeedbackGenerator().notificationOccurred(type)
    }
}
