//
//  CatImageView.swift
//  CatApp
//
//  Created by Huseyin on 06/09/2024.
//

import SwiftUI

struct CatImageView: View {
    
    var isLoading: Bool
    var imageURL: String?
    var height: CGFloat?
    
    var body: some View {
        if isLoading {
            CustomProgressView()
        } else if let urlStr = imageURL {
            let url = URL(string: urlStr)
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .frame(height: height)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    .shadow(radius: 10)
            } placeholder: {
                CustomProgressView()
            }
        } else {
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
    Group {
        CatImageView(isLoading: false, imageURL: "https://cdn2.thecatapi.com/images/a5h.jpg", height: 350)
    }
}
