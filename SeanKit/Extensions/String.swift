//
//  String.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation


public extension String {
    
    /// Remove all `www.` and `http://` type stuff at the beginning of the string, if any.
    mutating func makeCleanURL() {
        if self.hasPrefix("http://") {
            self.removeFirst(7)
        } else if self.hasPrefix("https://") {
            self.removeFirst(8)
        }
        if self.hasPrefix("www.") {
            self.removeFirst(4)
        }
    }
    
    /// Makes any string start with `https://www.`, even if it started with a different version of it.
    mutating func makeProperURL(addSForHttps: Bool) {
        self.makeCleanURL()
        self.addWwwPrefix()
        self.addHttpPrefix(addSForHttps: addSForHttps)
    }
    
    
    /// Returns a variation of any string that starts with `https://www.`, even if it started with a different version of it.
    func asProperURL(addSForHttps: Bool) -> String {
        var str = self
        str.makeCleanURL()
        str.addWwwPrefix()
        str.addHttpPrefix(addSForHttps: addSForHttps)
        return str
    }
    
    
    
    /// Adds `www.` if there is not one at the beginning. Does nothing if string is empty.
    mutating func addWwwPrefix() {
        if self == "" {
            return
        }
        if !self.hasPrefix("www.") {
            self = "www.\(self)"
        }
    }
    
    
    /// Adds `http://` if there is not one included. Does nothing if string is empty.
    mutating func addHttpPrefix(addSForHttps: Bool) {
        if self == "" {
            return
        }
        if !self.hasPrefix("http://") && !self.hasPrefix("https://") {
            let newString = addSForHttps ? "https://\(self)" : "http://\(self)"
            self = newString
        }
    }
    
    
    mutating func formatAsPhoneNumber() {
        if self.count == 11 { // US numbers with country code
            for x in (0 ..< self.count).reversed() {
                if x == 1 || x == 4 || x == 7 {
                    self.insert(" ", at: self.index(self.startIndex, offsetBy: x))
                }
            }
            return
        } else if self.count == 10 { // US numbers
            for x in (0 ..< self.count).reversed() {
                if x == 3 || x == 6 {
                    self.insert(" ", at: self.index(self.startIndex, offsetBy: x))
                }
            }
            return
        } else if self.count == 8 { // 8 digit foreign numbers
            for x in (0 ..< self.count).reversed() {
                if x == 4 {
                    self.insert(" ", at: self.index(self.startIndex, offsetBy: x))
                }
            }
            return
        } else {
            return
        }
    }
    
    
    /// Same results as `contains(other:StringProtocol)`, except with ability to ignore the case.
    func contains(_ string: String, caseSensitive: Bool) -> Bool {
        if caseSensitive {
            return self.contains(string)
        }
        let testString = string.lowercased()
        let testSelf = self.lowercased()
        return testSelf.contains(testString)
    }
}
