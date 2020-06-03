//
//  SKQRScannerView.swift
//  SeanKit
//
//  Created by Sean Li on 5/29/20.
//  Copyright © 2020 86 Houses LLC. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
/// QR Scanner for SwiftUI.
public struct SKQRScannerView: UIViewControllerRepresentable {
    
    @Binding var isPresented: Bool
    @Binding var codeFound: String?
    
    public init(isPresented: Binding<Bool>, codeFound: Binding<String?>) {
        self._isPresented = isPresented
        self._codeFound = codeFound
    }
    
    
    public class Coordinator: NSObject, SKQRScannerDelegate {
        
        var isPresented: Binding<Bool>
        var codeFound: Binding<String?>
        
        public func found(code: String) {
            codeFound.wrappedValue = code
            isPresented.wrappedValue = false
        }
        
        public init(isPresented: Binding<Bool>, codeFound: Binding<String?>) {
            self.isPresented = isPresented
            self.codeFound = codeFound
        }
    }
    
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(isPresented: $isPresented, codeFound: $codeFound)
    }
    
    public func makeUIViewController(context: Context) -> SKQRScannerVC {
        let scannerVC = SKQRScannerVC()
        scannerVC.scannerDelegate = context.coordinator
        return scannerVC
    }
    
    public func updateUIViewController(_ uiViewController: SKQRScannerVC, context: Context) {
        
    }
}

