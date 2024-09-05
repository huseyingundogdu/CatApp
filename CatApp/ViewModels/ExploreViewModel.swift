//
//  ExploreViewModel.swift
//  CatApp
//
//  Created by Huseyin on 03/09/2024.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    private let networkService = NetworkService()
    @Published var catImage: [CatImage] = []
    @Published var fact: Fact = fact1
    @Published var isLoading = false
    @Published var detailedCatImage: CatImage?
    var hasBreeds: Bool {
        detailedCatImage?.breeds != nil && !(detailedCatImage?.breeds?.isEmpty ?? true)
    }
    
    func getCatImage() async throws {
        isLoading = true
        defer { isLoading = false }
        catImage = try await networkService.fetchRandomCatImage()
        
        if let id = catImage.first?.id {
            try await getDetailsOfCat(id: id)
        }
    }
    
    func getFact() async throws {
        isLoading = true
        defer { isLoading = false }
        fact = try await networkService.fetchRandomFact()
    }
    
    func getDetailsOfCat(id: String) async throws {
        detailedCatImage = try await networkService.fetchSpesificCatImage(id: id)
    }
}
