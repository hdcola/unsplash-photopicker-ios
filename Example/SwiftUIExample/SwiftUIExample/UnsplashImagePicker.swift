//
//  UnsplashImagePickerView.swift
//  Example
//
//  Created by 老房东 on 2022-11-14.
//  Copyright © 2022 Unsplash. All rights reserved.
//

import SwiftUI
import UnsplashPhotoPicker

struct UnsplashImagePicker: UIViewControllerRepresentable {
    let query: String?
    @Binding var photos: [UnsplashPhoto]
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<UnsplashImagePicker>) -> UnsplashPhotoPicker {
        let configuration = UnsplashPhotoPickerConfiguration(
            accessKey: "<YOUR_ACCESS_KEY>",
            secretKey: "<YOUR_SECRET_KEY>",
            query: query,
            allowsMultipleSelection: false)
        let unsplashPhotoPicker = UnsplashPhotoPicker(configuration: configuration)
        unsplashPhotoPicker.photoPickerDelegate = context.coordinator
        return unsplashPhotoPicker
    }
    
    func makeCoordinator() -> UnsplashImagePicker.Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: UnsplashPhotoPickerDelegate {
        var parent: UnsplashImagePicker
        
        init(_ parent: UnsplashImagePicker) {
            self.parent = parent
        }
        
        func unsplashPhotoPicker(_ photoPicker: UnsplashPhotoPicker, didSelectPhotos photos: [UnsplashPhoto]) {
            parent.photos = photos
        }
        
        func unsplashPhotoPickerDidCancel(_ photoPicker: UnsplashPhotoPicker) {
            print("cancel")
        }
    }
    
    func updateUIViewController(_ uiViewController: UnsplashPhotoPicker, context: UIViewControllerRepresentableContext<UnsplashImagePicker>) {}
}
