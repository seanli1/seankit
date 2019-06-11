//
//  UIView.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

public extension UIView {
    
    /// Attempt to get the parent view controller of any UIView subclass.
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    /// Animate the background color. The `duration` is the fade time in as well as fade time out (total animation time is `duration` x 2).
    func flashColor(_ color: UIColor, _ duration: TimeInterval) {
        let originalColor = self.backgroundColor
        UIView.animate(withDuration: duration, animations: {
            self.backgroundColor = color
        }, completion: {(complete) in
            UIView.animate(withDuration: duration, animations: {
                self.backgroundColor = originalColor
            })
        })
    }
    
    /// Animate the alpha. The `duration` is the fade time in as well as fade time out (total animation time is `duration` x 2).
    func flashAlpha(_ alpha: CGFloat, _ duration: TimeInterval) {
        let originalAlpha = self.alpha
        UIView.animate(withDuration: duration, animations: {
            self.alpha = alpha
        }, completion: {(complete) in
            UIView.animate(withDuration: duration, animations: {
                self.alpha = originalAlpha
            })
        })
    }
    
    /// Add a gradient layer to this view. By default, goes diagonally across the entire view.
    func setBackgroundGradient(_ colorOne: UIColor, _ colorTwo: UIColor, _ direction: GradientDirection) {
        let gradLayer = CAGradientLayer()
        gradLayer.frame = bounds
        // start, end
        gradLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
//        gradLayer.locations = [0.0, 1.0]
        
        
        var startPoint: CGPoint!
        var endPoint: CGPoint!
        switch direction {
        case .bottomLeftToTopRight:
            startPoint = CGPoint(x: 0, y: 1)
            endPoint = CGPoint(x: 1, y: 0)
            
        case .bottomRightToTopLeft:
            startPoint = CGPoint(x: 1, y: 1)
            endPoint = CGPoint(x: 0, y: 0)
            
        case .topLeftToBottomRight:
            startPoint = CGPoint(x: 0, y: 0)
            endPoint = CGPoint(x: 1, y: 1)
            
        case .topRightToBottomLeft:
            startPoint = CGPoint(x: 1, y: 0)
            endPoint = CGPoint(x: 0, y: 1)
            
        case .leftToRight:
            startPoint = CGPoint(x: 0, y: 0.5)
            endPoint = CGPoint(x: 1, y: 0.5)
            
        case .rightToLeft:
            startPoint = CGPoint(x: 1, y: 0.5)
            endPoint = CGPoint(x: 0, y: 0.5)
            
        case .topToBottom:
            startPoint = CGPoint(x: 0.5, y: 0)
            endPoint = CGPoint(x: 0.5, y: 1)
            
        case .bottomToTop:
            startPoint = CGPoint(x: 0.5, y: 1)
            endPoint = CGPoint(x: 0.5, y: 0)
        }
        
        gradLayer.startPoint = startPoint
        gradLayer.endPoint = endPoint
        layer.insertSublayer(gradLayer, at: 0)
    }
    
    enum GradientDirection {
        // going clockwise
        case topLeftToBottomRight
        case topToBottom
        case topRightToBottomLeft
        case rightToLeft
        case bottomRightToTopLeft
        case bottomToTop
        case bottomLeftToTopRight
        case leftToRight
    }
}
