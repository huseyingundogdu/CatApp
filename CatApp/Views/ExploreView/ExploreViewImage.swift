//
//  ExploreViewImage.swift
//  CatApp
//
//  Created by Huseyin on 05/09/2024.
//

import SwiftUI

struct ExploreViewImage: View {
    
    @State var catImageURL: String
    
    var url: URL? {
        URL(string: catImageURL)
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .frame(height: 350) 
                    .clipShape(RoundedRectangle(cornerRadius: 24))
            } placeholder: {
                ProgressView()
                    .frame(height: 350)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ExploreViewImage(catImageURL: MockData.catImageDataWBreeds.url)
    }
}
