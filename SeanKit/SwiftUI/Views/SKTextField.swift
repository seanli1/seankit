//
//  SKTextField.swift
//  SeanKit
//
//  Created by Sean Li on 7/7/20.
//  Copyright © 2020 86 Houses LLC. All rights reserved.
//

import SwiftUI


/// Custom `UITextField` for SwiftUI that allows setting properties in initializer, including `done` bar button.
@available (iOS 13, *)
public struct SKTextField: View {
    
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    let returnKeyType: UIReturnKeyType
    let autocapitalizationType: UITextAutocapitalizationType
    let doneButton: Bool
    
    public init(_ text: Binding<String>, placeholder: String, keyboardType: UIKeyboardType = .default, returnKeyType: UIReturnKeyType = .default, autocapitalizationType: UITextAutocapitalizationType = .sentences, doneButton: Bool = true) {
        self._text = text
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        self.autocapitalizationType = autocapitalizationType
        self.doneButton = doneButton
    }
    
    public var body: some View {
        _SKTextField(self.$text, placeholder: self.placeholder, keyboardType: self.keyboardType, returnKeyType: self.returnKeyType, autocapitalizationType: self.autocapitalizationType)
            .frame(height: 24)
    }
}

/// Underlying `UIViewRepresentable` for `SKTextField`.
@available(iOS 13, *)
struct _SKTextField: UIViewRepresentable {
    
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    let returnKeyType: UIReturnKeyType
    let autocapitalizationType: UITextAutocapitalizationType
    let doneButton: Bool
    
    public init(_ text: Binding<String>, placeholder: String, keyboardType: UIKeyboardType = .default, returnKeyType: UIReturnKeyType = .default, autocapitalizationType: UITextAutocapitalizationType = .sentences, doneButton: Bool = true) {
        self._text = text
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        self.autocapitalizationType = autocapitalizationType
        self.doneButton = doneButton
    }
    
    public class Coordinator: NSObject, UITextFieldDelegate {
        
        var input: Binding<String>?
        
        convenience init(input: Binding<String>) {
            self.init()
            self.input = input
        }
        
        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            self.input?.wrappedValue = textField.text ?? ""
            return true
        }
        
        public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(input: self.$text)
    }
    
    func makeUIView(context: Context) -> UITextField {
        let tf = UITextField()
        if doneButton {
            tf.skAddDoneButton()
        }
        tf.placeholder = self.placeholder
        tf.keyboardType = self.keyboardType
        tf.returnKeyType = self.returnKeyType
        tf.autocapitalizationType = self.autocapitalizationType
        tf.delegate = context.coordinator
        return tf
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        
    }
}

