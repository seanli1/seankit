//
//  UIStackView.swift
//  GreenLife
//
//  Created by Sean Li on 7/9/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import UIKit


public extension UIStackView {
    
    convenience init(_ axis: NSLayoutConstraint.Axis, _ distribution: UIStackView.Distribution, _ alignment: UIStackView.Alignment, spacing: CGFloat) {
        self.init()
        self.axis = axis
        self.distribution = distribution
        self.alignment = alignment
        self.spacing = spacing
    }
    
    func addArrangedSubviews(_ views: [UIView]) {
        subviews.forEach { addArrangedSubview($0) }
    }
    
}
