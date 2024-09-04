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
                    if viewModel.isLoading {
                        ProgressView()
                            .frame(height: 350)
                    } else if let catImage = viewModel.catImage.first {
                        let imageURL = URL(string: catImage.url)
                        VStack {
                            AsyncImage(url: imageURL) { image in
                                image
                                    .resizable()
                                    .frame(height: 350)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                            } placeholder: {
                                ProgressView()
                                    .frame(height: 350)
                            }
                        }
                    } else {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(height: 350)
                    }
                }
                
                HStack {
                    Spacer()
                    Button {
                        //TODO: Like
                    } label: {
                        Image(systemName: "heart")
                            .imageScale(.large)
                    }
                    Button {
                        //TODO: Info
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .imageScale(.large)
                    }
                }
                    
                
                ScrollView {
                    
                    Text(viewModel.fact.data.first ?? "There is an issue about the Fact")
                        .multilineTextAlignment(.center)
                        .italic()
                }
                Spacer()
            }
            .padding()
            .navigationTitle("Explore")
            .task {
                await fetchImageAndFact()
            }
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
