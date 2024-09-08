//
//  LikedView.swift
//  CatApp
//
//  Created by Huseyin on 02/09/2024.
//

import SwiftUI

struct LikedView: View {
    
    @StateObject var viewModel = LikedViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.likedCats) { cat in
                        Button(action: {
                            //
                        }, label: {
                            LoadingImageView(isLoading: false, imageURL: cat.image.url, width: 120, height: 120)
                        })
                    }
                }
                .padding(.all, 10)
                .frame(width: .infinity, height: .infinity)
            }
            .task {
                Task {
                    try await viewModel.getFavouriteCats()
                }
            }
            .navigationTitle("Liked")
        }
    }
}

#Preview {
    LikedView()
}
