//
//  UITableView.swift
//  SeanKit
//
//  Created by Sean Li on 5/11/19.
//  Copyright © 2019 86 Houses LLC. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func skHeightOfVisibleCells() -> CGFloat {
        var addedHeight: CGFloat = 0
        for cell in self.visibleCells {
            addedHeight += cell.frame.height
        }
        return addedHeight
    }
    
}
