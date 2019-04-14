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
}
