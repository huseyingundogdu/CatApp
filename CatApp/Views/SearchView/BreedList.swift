//
//  BreedList.swift
//  CatApp
//
//  Created by Huseyin on 02/09/2024.
//

import SwiftUI

struct BreedList: View {
    
    var breeds: [Breed] = [breed1, breed2, breed3]
    @State var searchText = ""
    
    var body: some View {
        List(breeds) { breed in
            NavigationLink {
                BreedDetail(breed: breed)
            } label: {
                BreedRow(breed: breed)
            }
        }
    }
}

#Preview {
    BreedList()
}
