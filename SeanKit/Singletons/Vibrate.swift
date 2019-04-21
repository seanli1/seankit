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
public class Vibrate {
    
    private init() {}
    
    /// Vibrates with specific intensity. If entered nil, plays a default system vibrate.
    public static func withIntensity(_ intensity: UIImpactFeedbackGenerator.FeedbackStyle?) {
        if let intensity = intensity {
            let generator = UIImpactFeedbackGenerator(style: intensity)
            generator.impactOccurred()
        } else {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
    }
}
