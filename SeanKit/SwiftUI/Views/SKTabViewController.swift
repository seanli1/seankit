//
//  SKTabViewController.swift
//  SeanKit
//
//  Created by Sean Li on 7/6/20.
//  Copyright © 2020 86 Houses LLC. All rights reserved.
//

import SwiftUI


/// Container view to hold `SKTabView`s (which conform to `SKTabScheme`).
@available (iOS 13, *)
public struct SKTabViewController: UIViewControllerRepresentable {
    
    public var viewControllers: [SKTabScheme]
    
    public init(_ viewControllers: [SKTabScheme]) {
        self.viewControllers = viewControllers
    }
    
    public func makeUIViewController(context: Context) -> UITabBarController {
        let customTabView = UITabBarController()
        customTabView.setViewControllers(viewControllers, animated: false)
        return customTabView
    }
    public func updateUIViewController(_ uiViewController: UITabBarController, context: Context) {
        
    }
}


/// Pass this to `SKTabViewController` as its `viewControllers`. This is the same as passing a `UIHostingController`, except this includes the ability for adding a `tabBarItem` built in.
@available (iOS 13, *)
public class SKTabView<V: View>: UIHostingController<V>, SKTabScheme {
    public convenience init(_ rootView: V, _ tabBarItem: UITabBarItem) {
        self.init(rootView: rootView)
        self.tabBarItem = tabBarItem
    }
}

public protocol SKTabScheme: UIViewController {}
