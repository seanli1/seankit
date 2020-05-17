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
public class SKAppHelper {
    
    private init() {}
    
    static private let versionListKey = "versionListKey"
    static private let lastDateRunKey = "lastDateRunKey"
    
    
    
    /// Generic initializer for every app. Simply put at top of `AppDelegate` `didFinishLaunchingWithOptions`, and it will run what's needed to maintain the app. Good to have this implemented since first release.
    static public func initialize() {
        let _ = updateVersionList()
    }
    
    static public func hadPreviousVersion() -> Bool {
        if updateVersionList() == [] {
            return false
        } else {
            return true
        }
    }
    
    
    
    /// Returns the currently running app version.
    static public func getCurrentAppVersion() -> String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary["CFBundleShortVersionString"] as! String
        let build = dictionary["CFBundleVersion"] as! String
        return "\(version)b\(build)"
    }
    
    /// Update the version list stored. Good to have since first release.
    static private func updateVersionList() -> [String] {
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
    
    
    /// In `UserDefaults.standard`, move the stored object from one key to the other, and clear the original key.
    static public func changeSaveKeyForObject(fromKey: String, toKey: String) {
        
        if let stored = userDefaults.value(forKey: fromKey) {
            
            print("Updating key: \(fromKey)")
            print("To key: \(toKey)")
            print("With value: \(stored)\n")
            
            userDefaults.removeObject(forKey: fromKey)
            
            userDefaults.set(stored, forKey: toKey)
        } else {
            print("Key was clean: \(fromKey)\n")
        }
    }
    
    
    /// Kill switch check only. Don't add errorHandler, must be invisible.
    static public func check() {
        let addresses = [
            "https://raw.githubusercontent.com/seanli1/appfiles/master/shared/check",
            "https://raw.githubusercontent.com/seanli1/githubappfiles/master/shared/check",
            "https://bitbucket.org/seanli1/appfiles/raw/master/shared/check",
            "https://bitbucket.org/seanli1/githubappfiles/raw/master/shared/check"
        ]
        SKDownload.dataFromAddresses(addresses, executeOnFirstOnly: false) { (success, address, data) in
            
            if success {
                guard let stringResult = String(data: data, encoding: .utf8) else { return }
                let separator = "\n"
                let lines = stringResult.components(separatedBy: separator)
                for line in lines {
                    if line == "kill \(Bundle.main.bundleIdentifier!)" {
                        exit(1)
                    }
                }
            }
        }
    }
    
    
    /** Keep in mind that this block runs every time. It's up to you to make sure that you only run what you need to when it has been enough time, by checking against the completion block's `Bool`. Make sure the real action only happens when `Bool` is `true`, and only use `false` cases to do mundane things. Any more might defeat the purpose.
     
     Example:
     
     AppHelper.runBlock(after: 86400) { didTimePass, _ in
         didTimePass ? DataHandler.downloadLatestInfo() : print("Not enough time has passed to warrant a download")
     }
     
     Tips:
     - 60 secs per minute
     - 3600 secs per hour
     - 86400 secs per day
 */
    static public func runBlock(after: TimeInterval, block: ((Bool, TimeInterval) -> Void)) {
        let now = Date().timeIntervalSince1970
        if let saved = userDefaults.value(forKey: lastDateRunKey) as? TimeInterval {
            let diff = now - saved
            if diff > after {
                block(true, diff)
                userDefaults.setValue(now, forKey: lastDateRunKey)
            } else {
                block(false, diff)
            }
        } else {
            block(true, TimeInterval.infinity)
            userDefaults.setValue(now, forKey: lastDateRunKey)
        }
    }
    
}



