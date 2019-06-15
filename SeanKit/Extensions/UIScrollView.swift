//
//  UIScrollView.swift
//  SeanKit
//
//  Created by Sean Li on 5/6/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

public extension UIScrollView {
    
    func scrollToTop() {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
    }
    
    /**
     Update a text view's height. Must have already created a height constraint that is a constant because this adjusts it.
     
     Insert this wherever needed (viewWillAppear, textViewDidChange, etc.)
     */
    func updateHeightConstraint() {
        self.isScrollEnabled = false
        let estimatedSize = self.sizeThatFits(CGSize(width: self.frame.width, height: .infinity))
        for constraint in self.constraints {
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
    
}
