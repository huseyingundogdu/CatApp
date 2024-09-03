//
//  SearchView.swift
//  CatApp
//
//  Created by Huseyin on 02/09/2024.
//

import SwiftUI

struct SearchView: View {
    
    @State var breeds: [Breed] = [Breed]()
    @State var searchText: String = ""
        
    private var filteredBreeds: [Breed] {
        if searchText == "" {
            return breeds
        } else {
            return breeds.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {            
            BreedList(breeds: filteredBreeds)
                .navigationTitle("Search")
        }
        .searchable(text: $searchText)
        .autocorrectionDisabled()
    }
}

#Preview {
    SearchView(breeds: breeds)
}
