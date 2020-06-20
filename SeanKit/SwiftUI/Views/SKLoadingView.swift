//
//  SKLoadingView.swift
//  SeanKit
//
//  Created by Sean Li on 6/20/20.
//  Copyright © 2020 86 Houses LLC. All rights reserved.
//

import SwiftUI

@available(iOS 13,*)
public class SKLoadingView {
    
    private init() {}
    
    
    /// Binds to value between 0 and 1.
    public struct Circular: View {
        
        @Binding var value: CGFloat
        let color: Color
        let lineWidth: CGFloat
        let startPoint: StartPoint
        
        public enum StartPoint {
            case top, topRight, right, bottomRight, bottom, bottomLeft, left, topLeft, custom(Double)
            
            func value() -> Double {
                switch self {
                case .top:          return -90
                case .topRight:     return -45
                case .right:        return 0
                case .bottomRight:  return 45
                case .bottom:       return 90
                case .bottomLeft:   return 135
                case .left:         return 180
                case .topLeft:      return 225
                case .custom(let value):
                    return value
                }
            }
        }
        
        
        
        public init(_ value: Binding<CGFloat>, startPoint: StartPoint = .top, color: Color, lineWidth: CGFloat = 1) {
            self._value = value
            self.color = color
            self.lineWidth = lineWidth
            self.startPoint = startPoint
        }
        
        public var body: some View {
            Circle()
                .trim(from: 0, to: self.value)
                .stroke(color, lineWidth: self.lineWidth)
                .rotationEffect(.degrees(self.startPoint.value()))
        }
    }
    
}
