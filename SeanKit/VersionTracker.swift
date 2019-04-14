//
//  UserDefaults.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

public let userDefaults = UserDefaults.standard

/// Helps handle tracking the version the user has installed.
public class VersionTracker {
    
    private init() {}
    
    private let versionKey = "versionKey"
    
    /// Save the current app version to memory.
    func saveCurrentAppVersion() {
        userDefaults.set(getCurrentAppVersion(), forKey: versionKey)
    }
    
    /// Returns the currently running app version.
    func getCurrentAppVersion() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        let build = dictionary["CFBundleVersion"] as! String
        return "\(version)b\(build)"
    }
    
    /// Returns the last recorded version number of this app. Running this also overwrites last saved version number, meaning this can only be run once.
    func getPreviousAppVersion() -> String? {
        let storedVersion = userDefaults.value(forKey: versionKey) // Any?
        if let storedVersion = storedVersion as? String {
            return storedVersion
        } else {
            return nil
        }
    }
}



