//
//  UnsplashSearchView.swift
//  Example
//
//  Created by 老房东 on 2022-11-14.
//  Copyright © 2022 Unsplash. All rights reserved.
//


import SwiftUI
import UnsplashPhotoPicker

public struct UnsplashSearchView: View {
    let query: String?
    @Binding var images: [UnsplashPhoto]

    public init(query: String? = nil, images: Binding<[UnsplashPhoto]>) {
        self.query = query
        self._images = images
    }

    public var body: some View {
        ZStack(alignment: .topTrailing) {
            UnsplashImagePicker(query: query, photos: $images)
        }
    }
}

struct UnsplashSearchView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UnsplashSearchView(query: "computer", images: .constant([]))
        }
    }
}
