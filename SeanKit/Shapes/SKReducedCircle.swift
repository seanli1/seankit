//
//  SKReducedCircle.swift
//  SeanKit
//
//  Created by Sean Li on 5/17/20.
//  Copyright © 2020 86 Houses LLC. All rights reserved.
//

import SwiftUI

public struct SKReducedCircle: Shape {
    
    let multiple: CGFloat
    
    public init(multiple: CGFloat) {
        self.multiple = multiple
    }
    
    public func path(in rect: CGRect) -> Path {
        Path { path in
            let radius = (rect.width / 2) * multiple
            let center = CGPoint(x: rect.width / 2, y: rect.height / 2) // center
            path.addArc(center: center, radius: radius, startAngle: .degrees(0), endAngle: .degrees(360), clockwise: true)
        }
    }
}

