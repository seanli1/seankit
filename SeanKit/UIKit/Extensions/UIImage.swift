//
//  UIImage.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

public extension UIImage {

    
    // This version is worse than the one below. Why? Keeping here just to examine later.
//    func resized(to: CGSize) -> UIImage {
//        UIGraphicsBeginImageContext(to)
//        self.draw(in: CGRect(origin: .zero, size: to))
//        let result = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        if let result = result {
//            return result
//        } else {
//            print("Could not resize image")
//            return UIImage()
//        }
//    }
    
    enum ResizeStyle {
        case scaleToFill, squeezeToFit
    }
    
    func skResized(to: CGSize, style: ResizeStyle) -> UIImage {
        
        switch style {
        case .scaleToFill:
            let renderer = UIGraphicsImageRenderer(size: to)
            let image = renderer.image { _ in
                
                if self.size.width > self.size.height {
                    let ratio = self.size.width / self.size.height
                    let drawSize = CGSize(width: to.width * ratio, height: to.height)
                    
                    let diff = drawSize.width - drawSize.height
                    let side = diff / 2
                    
                    self.draw(in: CGRect.init(origin: CGPoint(x: -side, y: 0), size: drawSize))
                } else {
                    let ratio = self.size.height / self.size.width
                    let drawSize = CGSize(width: to.width, height: to.height * ratio)
                    
                    let diff = drawSize.height - drawSize.width
                    let side = diff / 2
                    
                    self.draw(in: CGRect.init(origin: CGPoint(x: 0, y: -side), size: drawSize))
                }
            }
            return image
            
            
            
        case .squeezeToFit:
            let renderer = UIGraphicsImageRenderer(size: to)
            let image = renderer.image { _ in
                self.draw(in: CGRect.init(origin: CGPoint.zero, size: to))
            }
            return image
        }
    }

//    Why the heck is this not working??
//    /// Saves to Documents directory as jpg.
//    func saveToDocuments(filename: String) {
//        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let fileURL = documentsDirectory.appendingPathComponent(filename)
//
//        FileManager.default.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
//
//        if let data = self.jpegData(compressionQuality: 1.0) {
//            do {
//                try data.write(to: fileURL)
//                print("saved data successfully")
//            } catch {
//                print("error saving file to documents:", error)
//            }
//        }
//    }
}
