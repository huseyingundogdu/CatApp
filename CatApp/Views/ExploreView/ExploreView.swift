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
                        print(viewModel.detailedCatImage ?? "---")
                    }
                } label: {
                    if viewModel.isLoading {
                        ProgressView()
                            .frame(height: 350)
                    } else if let catImage = viewModel.detailedCatImage {
                        //sadece url gonderilebilir
                        ExploreViewImage(catImage: catImage)
                    } else {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(height: 350)
                    }
                }
                /*
                if let catImage = viewModel.detailedCatImage {
                    ImageInteractionView(hasBreeds: viewModel.hasBreeds, catImage: catImage)
                    Text(catImage.id)
                }
                */
                
                ScrollView {
                    
                    Text(viewModel.fact.data.first ?? "There is an issue about the Fact")
                        .multilineTextAlignment(.center)
                        .italic()
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Explore")
//            .task {
//                await fetchImageAndFact()
//            }
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
