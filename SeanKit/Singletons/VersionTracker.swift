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
    
    static private let versionListKey = "versionListKey"
    
    
    /// Returns the currently running app version.
    static public func getCurrentAppVersion() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        let build = dictionary["CFBundleVersion"] as! String
        return "\(version)b\(build)"
    }
    
    /// Update the version list. Good to have this implemented since first release.
    static public func updateVersionList() -> [String] {
        var newArray: [String]!
        if let stored = userDefaults.value(forKey: versionListKey) as? [String] {
            newArray = stored
        } else {
            newArray = []
        }
        newArray.append(getCurrentAppVersion())
        newArray.removeDuplicates()
        
        userDefaults.set(newArray, forKey: versionListKey)
        
        print("Latest version list: \(newArray!)")
        
        return newArray
    }
}



