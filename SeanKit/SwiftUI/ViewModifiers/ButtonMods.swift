//
//  ButtonMods.swift
//  RequestLive
//
//  Created by Sean Li on 5/31/20.
//  Copyright © 2020 Sean Li. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)

public class SKViewMods {
    private init() {}

    /// Remember to add `.resizable()` before this modifier.
    public struct NavBarBtnSize: ViewModifier {
        
        public init() {}
        
        public func body(content: Content) -> some View {
            content
                .frame(width: 22, height: 22)
        }
        
    }

    /// Remember to add `.resizable()` before this modifier.
    public struct TabBarBtnSize: ViewModifier {
        
        public init() {}
        
        public func body(content: Content) -> some View {
            content
                .frame(width: 34, height: 34)
        }
    }
}



