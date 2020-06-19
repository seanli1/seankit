//
//  SKActivityView.swift
//  SeanKit
//
//  Created by Sean Li on 6/18/20.
//  Copyright © 2020 86 Houses LLC. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
/// 1.5x scale is nice if it is not accompanied by anything (like text).
public struct SKActivityView: UIViewRepresentable {
    
    public let scale: CGFloat
    
    public init(scale: CGFloat = 1) {
        self.scale = scale
    }
    
    public func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView()
        view.transform = CGAffineTransform(scaleX: scale, y: scale)
        view.startAnimating()
        return view
    }
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}
