//
//  SKBadgeCounter.swift
//  SeanKit
//
//  Created by Sean Li on 6/1/20.
//  Copyright © 2020 86 Houses LLC. All rights reserved.
//

import SwiftUI


/// Put this in a `ZStack(alignment: .bottomLeading)` alongside the `TabView`, and enclose everything inside a `GeometryReader`. Remember `badgePosition` starts at `1`, not `0`. Also use a computed property for `value`.
/// - parameter badgePosition: Enter which tab this is for. Starts at `1`, not `0`.
/// - parameter value: Use a computed property for this.
@available(iOS 13, *)
public struct SKBadgeCounter: View {
    
    let value: Int
    let badgePosition: CGFloat
    let numberOfTabs: CGFloat
    let geometry: GeometryProxy
    
    public init(_ value: Int, badgePosition: Int, numberOfTabs: Int, geometry: GeometryProxy) {
        self.value = value
        self.badgePosition = CGFloat(badgePosition)
        self.numberOfTabs = CGFloat(numberOfTabs)
        self.geometry = geometry
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.red)
                .frame(width: 19, height: 19)
            Text("\(self.value)")
                .foregroundColor(.white)
                .font(Font.system(size: 12))
                .frame(width: 24, height: 24)
        }
//        .frame(width: 18, height: 18) // 15
        .offset(x: ( ( 2 * self.badgePosition) - 0.95 ) * ( geometry.size.width / ( 2 * self.numberOfTabs ) ) + 2, y: -25)
        .opacity(self.value == 0 ? 0 : 1.0)
    }
}

