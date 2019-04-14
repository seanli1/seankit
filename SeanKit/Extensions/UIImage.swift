//
//  UIImage.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

public extension UIImage {
    
    func resized(to: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(to)
        self.draw(in: CGRect(origin: .zero, size: to))
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let result = result {
            return result
        } else {
            print("Could not resize image")
            return UIImage()
        }
    }
    
}
