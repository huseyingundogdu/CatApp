//
//  ImageInteractionView.swift
//  CatApp
//
//  Created by Huseyin on 04/09/2024.
//

import SwiftUI

struct CatImageInteractionView: View {
    
    var hasBreeds: Bool
    var catImage: CatImage
    var isLiked: Bool
    var onLikeButtonTapped: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                onLikeButtonTapped()
            } label: {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .imageScale(.large)
                    .foregroundColor(isLiked ? .red : .gray)
            }
            
            NavigationLink {
                if let breeds = catImage.breeds, !breeds.isEmpty {
                    BreedDetail(imageURL: catImage.url, breed: breeds[0])
                } else {
                    Text(catImage.url)
                    Text("nLink")
                }
            } label: {
                Image(systemName: "ellipsis.circle")
                    .imageScale(.large)
                
            }
            .disabled(!hasBreeds)
        }
    }
}

#Preview {
    
    NavigationStack {
        CatImageInteractionView(hasBreeds: true, catImage: MockData.catImageDataWBreeds, isLiked: true, onLikeButtonTapped: {print("Button tapped")})
    }
}
