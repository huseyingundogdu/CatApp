//
//  NetworkManager.swift
//  CatApp
//
//  Created by Huseyin on 03/09/2024.
//

import Foundation

protocol NSProtocol {
    func fetchBreeds() async throws -> [Breed]
    func fetchRandomCatImage() async throws -> [CatImage]
    func fetchRandomFact() async throws -> Fact
}

enum NSError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

class NetworkService: NSProtocol {
    private func fetch<T: Decodable>(urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else { throw NSError.invalidURL }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NSError.invalidResponse }
        
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw NSError.invalidData
        }
    }
    
    //MARK: - Fact
    func fetchRandomFact() async throws -> Fact {
        return try await fetch(urlString: Constants.URLs.randomFactURL)
    }
    
    
    func fetchRandomCatImage() async throws -> [CatImage] {
        return try await fetch(urlString: Constants.URLs.randomImageURL)
    }
    
    func fetchSpesificCatImage(id: String) async throws -> CatImage {
        return try await fetch(urlString: Constants.URLs.imageURL + id)
    }
    
    
    func fetchBreeds() async throws -> [Breed] {
        return try await fetch(urlString: Constants.URLs.breedsURL)
    }
}
