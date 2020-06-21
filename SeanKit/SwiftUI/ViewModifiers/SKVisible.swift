//
//  SKVisible.swift
//  SeanKit
//
//  Created by Sean Li on 6/20/20.
//  Copyright © 2020 86 Houses LLC. All rights reserved.
//

import SwiftUI


/// Pass boolean binding that determines if this is showing or not.
@available(iOS 13, *)
public struct SKVisible: ViewModifier {
    
    @Binding var isShowing: Bool
    
    public init(_ isShowing: Binding<Bool>) {
        self._isShowing = isShowing
    }
    
    public func body(content: Content) -> some View {
        Group {
            if self.isShowing {
                content
            }
        }
    }
    
}
