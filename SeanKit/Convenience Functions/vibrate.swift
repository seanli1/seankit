//
//  vibrate.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation
import AVFoundation

/// Vibrates with specific intensity. If entered nil, plays a default system vibrate.
public func vibrate(_ intensity: UIImpactFeedbackGenerator.FeedbackStyle?) {
    if let intensity = intensity {
        let generator = UIImpactFeedbackGenerator(style: intensity)
        generator.impactOccurred()
    } else {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}

