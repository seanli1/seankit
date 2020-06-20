//
//  SKConditionalView.swift
//  SeanKit
//
//  Created by Sean Li on 6/20/20.
//  Copyright © 2020 86 Houses LLC. All rights reserved.
//

import SwiftUI


@available(iOS 13,*)
/// If condition is true, shows `first`, otherwise ,shows `second`.
public struct SKConditionalView<U: View, V: View>: View {
    
    @Binding var condition: Bool
    let first: U
    let second: V
    
    public var body: some View {
        Group {
            if condition {
                self.first
            } else {
                self.second
            }
        }
    }
}

