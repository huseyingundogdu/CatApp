//
//  ExploreView.swift
//  CatApp
//
//  Created by Huseyin on 02/09/2024.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject private var viewModel: ExploreViewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Button {
                    Task {
                        await fetchImageAndFact()
                    }
                } label: {
                    LoadingImageView(isLoading: viewModel.isLoading, imageURL: viewModel.detailedCatImage?.url)
                }

                if let catImage = viewModel.detailedCatImage {
                    CatImageInteractionView(hasBreeds: viewModel.hasBreeds, catImage: catImage)
                }
                
                ScrollView {
                    
                    Text(viewModel.fact?.data.first ?? "Click the cat and start the journey! :)")
                        .multilineTextAlignment(.center)
                        .italic()
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Explore")
        }
    }
    
    
    private func fetchImageAndFact() async {
        do {
            try await viewModel.getCatImage()
            try await viewModel.getFact()
        } catch {
            print("Error about the image: \(error)")
        }
    }
}

#Preview {
    ExploreView()
}
