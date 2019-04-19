//
//  String.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation


public extension String {
    
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
    
    /// Adds `http://` if there is not one included. Does nothing if string is empty.
    mutating func addHttpPrefix() {
        if self == "" {
            return
        }
        if !self.hasPrefix("http://") && !self.hasPrefix("https://") {
            let newString = "http://\(self)"
            self = newString
        } else {
            return
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
}
