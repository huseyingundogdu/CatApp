//
//  LoadingImageView.swift
//  CatApp
//
//  Created by Huseyin on 06/09/2024.
//

import SwiftUI

struct LoadingImageView: View {
    
    var isLoading: Bool
    var imageURL: String?
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        if isLoading {
            CustomProgressView()
                .frame(width: width, height: height)
        } else if let url = imageURL {
            ExploreViewImage(catImageURL: url)
                .frame(width: width, height: height)
        } else {
            PlaceholderView(width: width, height: height)
        }
    }
}

#Preview {
    LoadingImageView(isLoading: false, imageURL: "https://cdn2.thecatapi.com/images/a2f.jpg", width: 300, height: 300)
}
