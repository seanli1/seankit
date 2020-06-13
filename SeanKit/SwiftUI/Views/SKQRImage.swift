//
//  SKQRImage.swift
//  SeanKit
//
//  Created by Sean Li on 6/3/20.
//  Copyright © 2020 86 Houses LLC. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI
import CoreImage.CIFilterBuiltins


@available(iOS 13, *)
public struct SKQRImage: View {
    
    let text: String
    
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        Image(uiImage: SKQRGenerator.createCode(from: text) ?? UIImage(systemName: "xmark.circle")!)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
    }
    
}
