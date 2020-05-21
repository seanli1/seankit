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
    
    
    enum WidthMode {
        /// Use this if scroll view already exists, and you are just updating its height.
        case inferFromCurrentState
        
        /// Use this to set the height constraint early in the view's existence. Enter the goal width for the view.
        case predeterminedWidth(CGFloat)
        
        /// Use this to set the height constraint early in the view's existence. Enter the padding from screen edges. This is the same as using `predeterminedWidth` and setting it to `UIScreen.main.bounds.width - padding`.
        case screenWidthMinusPadding(CGFloat)
    }
    
    
    /**
     Update a text view's height constraint.
     
     Completion block gives you access to the height that gets determined.
     
     Automatically sets the `isScrollEnabled` property to `false`.
     */
    func updateHeightConstraint(_ widthMode: WidthMode, completion: ((CGFloat?)-> Void)?) {
        self.isScrollEnabled = false
        
        var calcWidth: CGFloat
        
        switch widthMode {
        case .inferFromCurrentState:
            calcWidth = self.frame.width
            
        case .predeterminedWidth(let width):
            calcWidth = width
            
        case .screenWidthMinusPadding(let padding):
            calcWidth = UIScreen.main.bounds.width - padding
        }
        
        let estimatedSize = self.sizeThatFits(CGSize(width: calcWidth, height: .infinity))
        let height = estimatedSize.height
        for constraint in self.constraints {
            if constraint.firstAttribute == .height {
                constraint.constant = height
            }
        }
        completion?(height)
    }
    
}
