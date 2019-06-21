//
//  UILabel.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

public extension UILabel {
    
    var isTruncated: Bool {
        guard let labelText = text else {
            return false
        }
        let labelTextSize = (labelText as NSString).boundingRect(
            with: CGSize(width: frame.size.width, height: .greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [.font: font as Any],
            context: nil).size
        return labelTextSize.height > bounds.size.height
    }
    
    
    var isBlank: Bool {
        return self.text == nil || self.text?.count == 0 || self.text?.replacingOccurrences(of: "\n", with: "").count == 0 || self.text?.replacingOccurrences(of: " ", with: "").count == 0
    }
    
}
