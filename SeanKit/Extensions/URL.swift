//
//  getDocumentsDirectory.swift
//  SeanKit
//
//  Created by Sean Li on 4/19/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

extension URL {
    
    /// Returns the `URL` for the documents directory.
    var skDocDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
}
