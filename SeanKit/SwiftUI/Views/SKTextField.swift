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
    let clearButtonMode: UITextField.ViewMode
    let doneButton: Bool
    let standardViewMod: Bool
    
    
    // Default values go here, NOT in `_SKTextField`
    public init(_ placeholder: String, text: Binding<String>, keyboardType: UIKeyboardType = .default, returnKeyType: UIReturnKeyType = .default, autocapitalizationType: UITextAutocapitalizationType = .sentences, autocorrectionType: UITextAutocorrectionType = .default, clearButtonMode: UITextField.ViewMode = .always, doneButton: Bool = true, standardViewMod: Bool = true) {
        self._text = text
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        self.autocapitalizationType = autocapitalizationType
        self.autocorrectionType = autocorrectionType
        self.clearButtonMode = clearButtonMode
        self.doneButton = doneButton
        self.standardViewMod = standardViewMod
    }
    
    
    
    
    public var body: some View {
        Group {
            if self.standardViewMod {
                self.textField()
                .modifier(SKTextFieldMod())
            } else {
                self.textField()
            }
        }
        
    }
    
    private func textField() -> some View {
        _SKTextField(self.$text, placeholder: self.placeholder, keyboardType: self.keyboardType, returnKeyType: self.returnKeyType, autocapitalizationType: self.autocapitalizationType, autocorrectionType: self.autocorrectionType, clearButtonMode: self.clearButtonMode, doneButton: self.doneButton)
            .frame(height: 24)
    }
    
    /// Standard text field mod that looks nice.
    public struct SKTextFieldMod: ViewModifier {
        
        public init() {}
        
        public func body(content: Content) -> some View {
            content
                .padding([.leading, .trailing])
                .padding([.top, .bottom], 12)
                .background(Color.black.opacity(0.5))
                .cornerRadius(10)
                .padding()
        }
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
    let clearButtonMode: UITextField.ViewMode
    let doneButton: Bool
    
    let tf = UITextField()
    
    public init(_ text: Binding<String>, placeholder: String, keyboardType: UIKeyboardType, returnKeyType: UIReturnKeyType, autocapitalizationType: UITextAutocapitalizationType, autocorrectionType: UITextAutocorrectionType, clearButtonMode: UITextField.ViewMode, doneButton: Bool) {
        self._text = text
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        self.autocapitalizationType = autocapitalizationType
        self.autocorrectionType = autocorrectionType
        self.clearButtonMode = clearButtonMode
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
        tf.clearButtonMode = self.clearButtonMode
        tf.delegate = context.coordinator
        return tf
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = self.text
    }
}

