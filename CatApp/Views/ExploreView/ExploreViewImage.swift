//
//  ExploreViewImage.swift
//  CatApp
//
//  Created by Huseyin on 05/09/2024.
//

import SwiftUI

struct ExploreViewImage: View {
    
    let catImageURL: String
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: catImageURL)) { image in
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .shadow(radius: 10)
            } placeholder: {
                CustomProgressView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        ExploreViewImage(catImageURL: MockData.catImageDataWBreeds.url)
    }
}
