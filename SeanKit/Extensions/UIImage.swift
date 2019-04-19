//
//  UIImage.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

public extension UIImage {
    
    func resized(to: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(to)
        self.draw(in: CGRect(origin: .zero, size: to))
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        if let result = result {
            return result
        } else {
            print("Could not resize image")
            return UIImage()
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
