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
    
    var body: some View {
        if isLoading {
            CustomProgressView()
        } else if let url = imageURL {
            ExploreViewImage(catImageURL: url)
        } else {
            //when App run
            ZStack {
                RoundedRectangle(cornerRadius: 24)
                    .frame(height: 350)
                    .blur(radius: 10)
                Text("🐈")
                    .font(.system(size: 65))
            }
        }
    }
}

#Preview {
    LoadingImageView(isLoading: false)
}
