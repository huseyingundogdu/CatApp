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
            //TODO: rectangle to image
            RoundedRectangle(cornerRadius: 12)
                .frame(height: 300)
            
            Text(breed.temperament)
                .multilineTextAlignment(.center)
                .italic()
                .foregroundStyle(.secondary)
                
            Text(breed.description)
                .font(.title2)
            
            Spacer()
        }
        .padding()
        .navigationTitle(breed.name)
    }
}

#Preview {
    BreedDetail()
}
