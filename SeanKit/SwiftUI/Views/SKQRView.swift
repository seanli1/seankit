//
//  SKQRView.swift
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
public struct SKQRView: View {
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    let text: String
    
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        Image(uiImage: self.generateQRCode(from: text))
        .interpolation(.none)
        .resizable()
        .scaledToFit()
    }
    
    /// Returns an "xmark.circle" image if the image fails.
    private func generateQRCode(from string: String) -> UIImage {
        print(string)
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")
        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
