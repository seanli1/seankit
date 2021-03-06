//
//  UILabel.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

public extension UILabel {
    
    var skIsTruncated: Bool {
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
    
    /// Returns `true` if text is blank after removing white spaces and returns.
    var skIsBlank: Bool {
        return self.text == nil || self.text?.isEmpty ?? false || self.text?.replacingOccurrences(of: "\n", with: "").isEmpty ?? false || self.text?.replacingOccurrences(of: " ", with: "").isEmpty ?? false
    }
    
}
