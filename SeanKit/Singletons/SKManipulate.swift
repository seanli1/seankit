//
//  Manipulate.swift
//  SeanKit
//
//  Created by Sean Li on 5/23/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation


public class SKManipulate {
    
    private init() {}
    
    /// Convert text to an array (specifying separators) that's easier to code with.
    static public func textToArray(_ text: String, separator: String, ignoreBlank: Bool) -> [String] {
        
        let array = text.components(separatedBy: separator)
        
        var result = [String]()
        
        for item in array {
            if !(item == "" && ignoreBlank) {
                result.append(item)
            }
        }
        return result
    }
    
}
