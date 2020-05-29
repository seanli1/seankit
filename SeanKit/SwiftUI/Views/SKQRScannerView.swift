//
//  SKQRScannerView.swift
//  SeanKit
//
//  Created by Sean Li on 5/29/20.
//  Copyright © 2020 86 Houses LLC. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
/// QR Scanner for SwiftUI. Completion returns the result found.
public struct SKQRScannerView: UIViewControllerRepresentable {
    
    @Binding var isPresented: Bool
    let completion: ((String) -> ())
    
    public init(isPresented: Binding<Bool>, codeFound: @escaping ((String)->())) {
        self._isPresented = isPresented
        self.completion = codeFound
    }
    
    public class Coordinator: NSObject, SKQRScannerDelegate {
        
        var isPresented: Binding<Bool>
        let completion: ((String) -> ())
        
        public func found(code: String) {
            completion(code)
            isPresented.wrappedValue = false
        }
        
        public init(isPresented: Binding<Bool>, completion: @escaping ((String)->())) {
            self.isPresented = isPresented
            self.completion = completion
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(isPresented: $isPresented, completion: completion)
    }
    
    public func makeUIViewController(context: Context) -> SKQRScannerVC {
        let scannerVC = SKQRScannerVC()
        scannerVC.scannerDelegate = context.coordinator
        return scannerVC
    }
    public func updateUIViewController(_ uiViewController: SKQRScannerVC, context: Context) {
        
    }
}

