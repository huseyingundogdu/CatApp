//
//  BreedRow.swift
//  CatApp
//
//  Created by Huseyin on 02/09/2024.
//

import SwiftUI

struct BreedRow: View {
    
    let breed: Breed
    
    var body: some View {
        HStack {
           //FIXME: use loadingimageview
            if let imageID = breed.referenceImageID {
                AsyncImage(url: URL(string: Constants.URLs.spesificImageURL(imageID))) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                } placeholder: {
                    ProgressView()
                }
            } else {
                RoundedRectangle(cornerRadius: 12.0)
                    .frame(width: 100, height: 100)
            }
            
            VStack(alignment: .leading) {
                Text(breed.name)
                    .font(.title)
                    .bold()
                Text(breed.temperament)
            }
        }
    }
}

#Preview {
    BreedRow(breed: breed1)
}
