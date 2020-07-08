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
    let autocorrectionType: UITextAutocorrectionType
    let doneButton: Bool
    
    public init(_ placeholder: String, text: Binding<String>, keyboardType: UIKeyboardType = .default, returnKeyType: UIReturnKeyType = .default, autocapitalizationType: UITextAutocapitalizationType = .sentences, autocorrectionType: UITextAutocorrectionType = .default, doneButton: Bool = true) {
        self._text = text
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        self.autocapitalizationType = autocapitalizationType
        self.autocorrectionType = autocorrectionType
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
    let autocorrectionType: UITextAutocorrectionType
    let doneButton: Bool
    
    let tf = UITextField()
    
    public init(_ text: Binding<String>, placeholder: String, keyboardType: UIKeyboardType = .default, returnKeyType: UIReturnKeyType = .default, autocapitalizationType: UITextAutocapitalizationType = .sentences, autocorrectionType: UITextAutocorrectionType = .default, doneButton: Bool = true) {
        self._text = text
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        self.autocapitalizationType = autocapitalizationType
        self.autocorrectionType = autocorrectionType
        self.doneButton = doneButton
    }
    
    public class Coordinator: NSObject, UITextFieldDelegate {
        
        var textField: UITextField?
        var input: Binding<String>?
        
        convenience init(textField: UITextField, input: Binding<String>) {
            self.init()
            self.textField = textField
            self.input = input
            
            NotificationCenter.default.addObserver(self, selector: #selector(textChanged), name: UITextField.textDidChangeNotification, object: nil)
        }
        
        @objc func textChanged() {
            self.input?.wrappedValue = textField?.text ?? ""
        }
        
        public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(textField: tf, input: self.$text)
    }
    
    func makeUIView(context: Context) -> UITextField {
        if doneButton {
            tf.skAddDoneButton()
        }
        tf.placeholder = self.placeholder
        tf.keyboardType = self.keyboardType
        tf.returnKeyType = self.returnKeyType
        tf.autocapitalizationType = self.autocapitalizationType
        tf.autocorrectionType = self.autocorrectionType
        tf.delegate = context.coordinator
        return tf
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = self.text
    }
}

