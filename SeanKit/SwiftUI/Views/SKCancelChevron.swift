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
    
    public let customText: String?
    public let customColor: Color?
    
    public init(_ customText: String? = nil, _ customColor: Color? = nil) {
        self.customText = customText
        self.customColor = customColor
    }
    
    public var body: some View {
        VStack(spacing: -5) {
            Text(self.customText ?? "Cancel")
                .font(.headline)
            Image(systemName: "chevron.compact.down")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
        }
        .offset(y: -(SKScreen.height / 2) + 80)
        .foregroundColor(self.customColor ?? Color.white.opacity(0.2))
    }
}

