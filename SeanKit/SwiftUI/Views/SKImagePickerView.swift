//
//  SKImagePickerView.swift
//  SeanKit
//
//  Created by Sean Li on 6/9/20.
//  Copyright © 2020 86 Houses LLC. All rights reserved.
//

import SwiftUI


@available(iOS 13, *)
public struct SKImagePickerView: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode)
    private var presentationMode
    
    public let sourceType: UIImagePickerController.SourceType
    public let onImagePicked: (UIImage) -> Void
    
    public init(sourceType: UIImagePickerController.SourceType, onImagePicked: @escaping (UIImage) -> ()) {
        self.sourceType = sourceType
        self.onImagePicked = onImagePicked
    }
    
    public final class Coordinator: NSObject,
        UINavigationControllerDelegate,
    UIImagePickerControllerDelegate {
        
        @Binding
        private var presentationMode: PresentationMode
        private let sourceType: UIImagePickerController.SourceType
        private let onImagePicked: (UIImage) -> Void
        
        init(presentationMode: Binding<PresentationMode>,
             sourceType: UIImagePickerController.SourceType,
             onImagePicked: @escaping (UIImage) -> Void) {
            _presentationMode = presentationMode
            self.sourceType = sourceType
            self.onImagePicked = onImagePicked
        }
        
        public func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            onImagePicked(uiImage)
            presentationMode.dismiss()
            
        }
        
        public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            presentationMode.dismiss()
        }
        
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(presentationMode: presentationMode,
                           sourceType: sourceType,
                           onImagePicked: onImagePicked)
    }
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<SKImagePickerView>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    public func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<SKImagePickerView>) {
        
    }
    
}
