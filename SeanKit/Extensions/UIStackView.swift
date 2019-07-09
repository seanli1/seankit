//
//  UIStackView.swift
//  GreenLife
//
//  Created by Sean Li on 7/9/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import UIKit


public extension UIStackView {
    
    func addArrangedSubviews(_ views: [UIView]) {
        subviews.forEach { addArrangedSubview($0) }
    }
    
}
