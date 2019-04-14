//
//  Testing.swift
//  SeanKit
//
//  Created by Sean Li on 4/14/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import Foundation


public func test(_ message: String) {
    print("❗️ - ", message)
}


public func testView(_ forFrame: CGRect, _ inView: UIView) {
    let view = UIView(frame: forFrame)
    view.backgroundColor = .red
    inView.addSubview(view)
}
