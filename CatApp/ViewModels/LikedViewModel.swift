//
//  LikedViewModel.swift
//  CatApp
//
//  Created by Huseyin on 08/09/2024.
//

import Foundation


class LikedViewModel: ObservableObject {
    
    private let networkService = NetworkService()
    
    @Published var likedCats: [FavouriteCatImage] = []
    
    func getFavouriteCats() async throws {
        likedCats = try await networkService.fetchLikedCats()
    }
}
