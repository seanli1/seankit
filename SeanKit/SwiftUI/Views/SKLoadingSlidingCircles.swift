//
//  SKLoadingSlidingCircles.swift
//  SeanKit
//
//  Created by Sean Li on 6/18/20.
//  Copyright © 2020 86 Houses LLC. All rights reserved.
//

import SwiftUI


@available(iOS 13, *)
public struct SKLoadingSlidingCircles: View {
    
    let color: Color
    
    public init(_ color: Color) {
        self.color = color
    }
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var leftOffset: CGFloat = -50
    @State var rightOffset: CGFloat = 50
    
    public var body: some View {
        ZStack {
            Circle()
                .fill(self.color)
                .frame(width: 20, height: 20)
                .offset(x: leftOffset)
                .opacity(0.7)
                .animation(Animation.easeInOut(duration: 1))
            Circle()
                .fill(self.color)
                .frame(width: 20, height: 20)
                .offset(x: leftOffset)
                .opacity(0.7)
                .animation(Animation.easeInOut(duration: 1).delay(0.2))
            Circle()
                .fill(self.color)
                .frame(width: 20, height: 20)
                .offset(x: leftOffset)
                .opacity(0.7)
                .animation(Animation.easeInOut(duration: 1).delay(0.4))
        }
        .onReceive(timer) { (_) in
            swap(&self.leftOffset, &self.rightOffset)
        }
    }
    
}
