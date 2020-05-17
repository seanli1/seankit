//
//  VerticallyAlignableLabel.swift
//  SeanKit
//
//  Created by Sean Li on 6/16/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import UIKit

/// Simply allows you to set `contentMode` to `.bottom` or `.top`.
public class SKVerticallyAlignableLabel: UILabel {
    
    public override func drawText(in rect: CGRect) {
        var newRect = rect
        switch contentMode {
        case .top:
            newRect.size.height = sizeThatFits(rect.size).height
        case .bottom:
            let height = sizeThatFits(rect.size).height
            newRect.origin.y += rect.size.height - height
            newRect.size.height = height
        default:
            ()
        }
        super.drawText(in: newRect)
    }
}

