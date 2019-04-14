//
//  Array.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

extension Array where Element: Hashable {
    
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
}
