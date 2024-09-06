//
//  BreedDetail.swift
//  CatApp
//
//  Created by Huseyin on 02/09/2024.
//

import SwiftUI

struct BreedDetail: View {
    
    var imageURL: String?
    var breed: Breed = breed1
    
    var urlString: String? {
        if let imageURL = imageURL, !imageURL.isEmpty {
            return imageURL
        } else if let referenceImageID = breed.referenceImageID, !referenceImageID.isEmpty {
            return Constants.URLs.spesificImageURL(referenceImageID)
        } else {
            return nil
        }
    }
    
    var url: URL? {
        return URL(string: urlString ?? "")
    }
    
    var body: some View {
        VStack(spacing: 20) {
            
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .frame(height: 350)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
            } placeholder: {
                ProgressView()
                    .frame(height: 350)
            }
            
            
            Text(breed.temperament)
                .multilineTextAlignment(.center)
                .italic()
                .foregroundStyle(.secondary)
            
            ScrollView {
                Text(breed.description)
                    .font(.title2)
            }
            Spacer()
        }
        .padding()
        .navigationTitle(breed.name)
    }
}

#Preview {
    BreedDetail()
}
