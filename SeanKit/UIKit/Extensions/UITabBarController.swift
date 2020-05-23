//
//  UITabBarController.swift
//  SeanKit
//
//  Created by Sean Li on 6/28/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import UIKit

public extension UITabBarController {
    
    /**
     If the selected view controller is a `UINavigationController`, then pop it to its root if the tab is tapped twice. Place this in the `tabBar(_ tabBar:didSelect item:)` delegate function.
     */
    func skPopToRootIfDoubleTapped() {
        
        guard let vc = selectedViewController as? UINavigationController else { return }
        
        // selectedViewController gets you the vc selected before actually switching tabs.
        var lastVcIndex: Int?
        for y in 0 ..< (viewControllers?.count ?? 0) {
            if selectedViewController === viewControllers?[y] {
                lastVcIndex = y
                break
            }
        }
        
        // tabBar.selectedItem gets you the item selected after switching tabs.
        var nextVcIndex: Int?
        for x in 0 ..< (tabBar.items?.count ?? 0) {
            if tabBar.selectedItem == tabBar.items?[x] {
                nextVcIndex = x
                break
            }
        }
        
        // Compare the indices of those. If they're the same, then that means you're tapping the tab on the same vc.
        if lastVcIndex == nextVcIndex {
            vc.popToRootViewController(animated: true)
        }
    }
    
}
