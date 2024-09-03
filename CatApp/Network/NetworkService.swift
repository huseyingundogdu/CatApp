//
//  NetworkManager.swift
//  CatApp
//
//  Created by Huseyin on 03/09/2024.
//

import Foundation

protocol NSProtocol {
    func fetchBreeds() async throws -> [Breed]
}

enum NSError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

class NetworkService: NSProtocol {
    func fetchBreeds() async throws -> [Breed] {
        guard let url = URL(string: Constants.URLs.breedsURL) else {
            throw NSError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NSError.invalidResponse
        }
        
        do {
            let decodedData = try JSONDecoder().decode([Breed].self, from: data)
            return decodedData
        } catch {
            throw NSError.invalidData
        }
    }
}
