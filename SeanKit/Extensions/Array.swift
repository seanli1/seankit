//
//  Array.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

public extension Array where Element: Hashable {
    
    /// Return an array with duplicates removed. Elements must be Hashable.
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    
    
    /// Removes duplicates from an array. Elements must be hashable.
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
    
    
    func getIndexOf(string: String) -> Int? {
        for x in 0 ..< count {
            if self[x] as? String == string {
                return x
            }
        }
        print("Error: String not found in array")
        return nil
    }
}
