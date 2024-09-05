//
//  ExploreViewImage.swift
//  CatApp
//
//  Created by Huseyin on 05/09/2024.
//

import SwiftUI

struct ExploreViewImage: View {
    
    @State var catImage: CatImage
    
    var body: some View {
        VStack {
            if let url = URL(string: catImage.url) {
                
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .frame(height: 350)
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                } placeholder: {
                    ProgressView()
                        .frame(height: 350)
                }
            } else {
                //Image url is not valid
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 350)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ExploreViewImage(catImage: MockData.catImageDataWBreeds)
    }
}
