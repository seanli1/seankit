//
//  Testing.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

/// Singleton for convenient app testing functions in SeanKit.
public class Tester {
    
    private init() {}
    
    /// Print the message to the console prefixed with a `❗️` emoji.
    static public func print(_ message: String) {
        Swift.print("❗️ - ", message)
    }
    
    /// Places a 0.5 alpha red view onto a specified frame to help make things more visible.
    static public func view(_ forFrame: CGRect, _ inView: UIView) {
        let view = UIView(frame: forFrame)
        view.alpha = 0.5
        view.backgroundColor = .red
        inView.addSubview(view)
    }
    
}
