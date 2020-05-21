//
//  UIImageView.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation


public extension UIImageView {
    
    func isEmpty() -> Bool {
        if let image = image {
            if image.size == CGSize(width: 0, height: 0) {
                return true
            } else {
                return false
            }
        } else {
            return true
        }
    }
    
}
