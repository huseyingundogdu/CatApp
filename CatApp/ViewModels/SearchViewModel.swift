//
//  SearchViewModel.swift
//  CatApp
//
//  Created by Huseyin on 03/09/2024.
//

import Foundation


class SearchViewModel: ObservableObject {
    
    private let networkService = NetworkService()
    
    @Published var breeds: [Breed] = [Breed]()
    
    func getBreeds() async throws {
        do {
            self.breeds = try await networkService.fetchBreeds()
        } catch NSError.invalidURL {
            print("invalid url")
        } catch NSError.invalidResponse {
            print("invalid response")
        } catch NSError.invalidData {
            print("invalid data")
        } catch {
            print("error")
            print(error.localizedDescription)
        }
    }
    
    init() {
        Task {
           try await getBreeds()
        }
    }
}
