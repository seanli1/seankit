//
//  SKCancelChevron.swift
//  SeanKit
//
//  Created by Sean Li on 6/18/20.
//  Copyright © 2020 86 Houses LLC. All rights reserved.
//

import SwiftUI


/// Add this to a ZStack container.
@available(iOS 13, *)
public struct SKCancelChevron: View {
    
    public enum Header {
        case cancel
        case close
        case custom(String)
        
        func text() -> String {
            switch self {
            case .cancel:           return "Cancel"
            case .close:            return "Close"
            case .custom(let str):  return str
            }
        }
    }
    
    public let header: Header?
    public let customColor: Color?
    public let adjustOffset: CGFloat?
    
    public init(_ header: Header? = nil, _ customColor: Color? = nil, adjOffset: CGFloat? = nil) {
        self.header = header
        self.customColor = customColor
        self.adjustOffset = adjOffset
    }
    
    public var body: some View {
        VStack(spacing: -5) {
            if self.header != nil {
                Text(self.header!.text())
                    .font(.headline)
            }
            Image(systemName: "chevron.compact.down")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }
        .offset(y: -(SKScreen.height / 2) + 70 + (self.adjustOffset ?? 0))
        .foregroundColor(self.customColor ?? Color.white.opacity(0.2))
    }
}

