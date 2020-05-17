//
//  QRGenerator.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

/// Singleton for convenient QR generation functions in SeanKit.
public class SKQRGenerator {
    
    private init() {}
    
    static public func createCode(_ fromString: String) -> UIImage {
        let transform = CGAffineTransform(scaleX: 5, y: 5)
        let data = fromString.data(using: .ascii)
        let filter = CIFilter(name: "CIQRCodeGenerator")!
        filter.setValue(data, forKey: "inputMessage")
        let qrCodeImage = filter.outputImage?.transformed(by: transform)
        if qrCodeImage != nil {
            return UIImage(ciImage: qrCodeImage!)
        } else {
            print("qrImageFromString: output image is nil")
            return UIImage()
        }
    }
    
}
