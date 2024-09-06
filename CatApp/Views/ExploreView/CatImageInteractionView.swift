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
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "heart")
                    .imageScale(.large)
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
        CatImageInteractionView(hasBreeds: true, catImage: MockData.catImageDataWBreeds)
    }
}
