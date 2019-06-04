//
//  DispatchGroup.swift
//  SeanKit
//
//  Created by Sean Li on 6/3/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

public extension DispatchGroup {
    
    var count: Int? {
        let debugDescription = self.debugDescription
        let components = debugDescription.components(separatedBy: ",")
        let componentWithCount = components.filter( {$0.contains("count")} )
        let onlyComponentWithCount = componentWithCount.first
        let countString = onlyComponentWithCount?.filter( {CharacterSet.decimalDigits.contains(UnicodeScalar($0.lowercased()) ?? UnicodeScalar("")!)} )
        let count = Int(countString ?? "")
        print(count)
        return count
    }
    
}
