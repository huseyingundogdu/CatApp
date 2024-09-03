//
//  SearchView.swift
//  CatApp
//
//  Created by Huseyin on 02/09/2024.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewModel()
    @State var searchText: String = ""
        
    private var filteredBreeds: [Breed] {
        if searchText == "" {
            return viewModel.breeds
        } else {
            return viewModel.breeds.filter { $0.name.lowercased().contains(searchText.lowercased()) }
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
    SearchView()
}
