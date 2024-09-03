//
//  BreedDetail.swift
//  CatApp
//
//  Created by Huseyin on 02/09/2024.
//

import SwiftUI

struct BreedDetail: View {
    
    var breed: Breed = breed1
    
    var body: some View {
        VStack(spacing: 20) {
            if let imageID = breed.referenceImageID {
                let url = URL(string: Constants.URLs.spesificImageURL(imageID))
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .frame(height: 300)
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                    } placeholder: {
                        ProgressView()
                    }
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .frame(height: 300)
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
