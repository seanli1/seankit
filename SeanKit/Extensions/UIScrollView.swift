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
     
     Provide `predeterminedWidth` to use that as a hard and reliable reference. If not, it will infer the object's current width. Note that sometimes, the inferred width will be 0.0 if called at the wrong time.
     
     Completion block gives you access to the height that gets determined.
     */
    func updateHeightConstraint(predeterminedWidth: CGFloat?, completion: ((CGFloat)-> Void)?) {
        self.isScrollEnabled = false
        let estimatedSize = self.sizeThatFits(CGSize(width: predeterminedWidth ?? self.frame.width, height: .infinity))
        let height = estimatedSize.height
        for constraint in self.constraints {
            if constraint.firstAttribute == .height {
                constraint.constant = height
                completion?(height)
            }
        }
    }
    
}
