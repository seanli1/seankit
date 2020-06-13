//
//  QRGenerator.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation
import SwiftUI
import CoreImage.CIFilterBuiltins

/// Singleton for convenient QR generation functions in SeanKit.
public class SKQRGenerator {
    
    private init() {}
    
    // This version didn't work with Request Live
//    static public func createCode(_ fromString: String) -> UIImage {
//        let transform = CGAffineTransform(scaleX: 5, y: 5)
//        let data = fromString.data(using: .ascii)
//        let filter = CIFilter(name: "CIQRCodeGenerator")!
//        filter.setValue(data, forKey: "inputMessage")
//        let qrCodeImage = filter.outputImage?.transformed(by: transform)
//        if qrCodeImage != nil {
//            return UIImage(ciImage: qrCodeImage!)
//        } else {
//            print("qrImageFromString: output image is nil")
//            return UIImage()
//        }
//    }
    
    
    @available(iOS 13, *)
    static public func createCode(from string: String) -> UIImage? {
        
        // get the data of the string in utf8 encoding
        let data = Data(string.utf8)
        
        // establish filter and drawing context
        // filter is a qr code generator
        let filter = CIFilter.qrCodeGenerator()
        let context = CIContext()
        
        // set the data for key `inputMessage` in the filter
        filter.setValue(data, forKey: "inputMessage")
        
        // set a transform to change the output image
        let transform = CGAffineTransform(scaleX: 30, y: 30)
        
        if let outputImage = filter.outputImage?.transformed(by: transform), let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            return UIImage(cgImage: cgimg)
        } else {
            return nil
        }
    }
}
