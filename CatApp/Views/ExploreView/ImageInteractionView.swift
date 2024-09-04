//
//  ImageInteractionView.swift
//  CatApp
//
//  Created by Huseyin on 04/09/2024.
//

import SwiftUI

struct ImageInteractionView: View {
    
    @State var cat: CatImage
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                
            } label: {
                Image(systemName: "heart")
                    .imageScale(.large)
            }
            
            Button {
                //
            } label: {
                Image(systemName: "ellipsis.circle")
                    .imageScale(.large)
            }
        }
    }
}

#Preview {
    ImageInteractionView(cat: cat2)
}

let cat1 = CatImage(
    id: "2lt",
    url: "https://cdn2.thecatapi.com/images/2lt.jpg",
    breeds: nil,
    width: 500,
    height: 333
)

let cat2 = CatImage(
id: "OhTkBTPnD",
url: "https://cdn2.thecatapi.com/images/OhTkBTPnD.jpg",
breeds: [Breed(id: "birm", name: "Birman", temperament: "Affectionate, Active, Gentle, Social", description: "The Birman is a docile, quiet cat who loves people and will follow them from room to room. Expect the Birman to want to be involved in what you’re doing. He communicates in a soft voice, mainly to remind you that perhaps it’s time for dinner or maybe for a nice cuddle on the sofa. He enjoys being held and will relax in your arms like a furry baby.", referenceImageID: "HOrX5gwLS")],
width: 1100,
height: 1100
)
