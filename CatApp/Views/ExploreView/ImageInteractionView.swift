//
//  ImageInteractionView.swift
//  CatApp
//
//  Created by Huseyin on 04/09/2024.
//

import SwiftUI

struct ImageInteractionView: View {
    
    var hasBreeds: Bool
    @State var catImage: CatImage
    
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
                    BreedDetail(breed: breeds[0])
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
        ImageInteractionView(hasBreeds: true, catImage: MockData.catImageDataWBreeds)
    }
}
