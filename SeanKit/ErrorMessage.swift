//
//  ErrorMessage.swift
//  RequestLive
//
//  Created by Sean Li on 6/24/20.
//  Copyright © 2020 Sean Li. All rights reserved.
//

import SwiftUI

/// Make all error messages uniform by making them in the enum.
@available(iOS 13, *)
public protocol ErrorMessage: Error {
    /// Return a message for any given error case.
    func message() -> String
    /// Return an alert view for any given error case, using the `message` function.
    func alert() -> Alert
}
