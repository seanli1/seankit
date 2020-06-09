//
//  SKAlertItem_SKActionSheetItem.swift
//  SeanKit
//
//  Created by Sean Li on 6/9/20.
//  Copyright © 2020 86 Houses LLC. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
public struct SKAlertItem: Identifiable {
    public let id = UUID()
    public let alert: Alert
    
    public init(_ alert: Alert) {
        self.alert = alert
    }
}

@available(iOS 13, *)
public struct SKActionSheetItem: Identifiable {
    public let id = UUID()
    public let actionSheet: ActionSheet
    public init(_ actionSheet: ActionSheet) {
        self.actionSheet = actionSheet
    }
}

