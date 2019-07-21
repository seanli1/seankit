//
//  print.swift
//  SeanKit
//
//  Created by Sean Li on 7/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation

public func printspc(_ items: Any...) {
    print()
    print("---")
    print(String(describing: items))
    print("---")
    print()
}
