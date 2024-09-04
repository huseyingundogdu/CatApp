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
    func fetchRandomFact() async throws -> Fact {
        guard let url = URL(string: Constants.URLs.randomFactURL) else {
            throw NSError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NSError.invalidResponse
        }
        
        do {
            let decodedData = try JSONDecoder().decode(Fact.self, from: data)
            return decodedData
        } catch {
            throw NSError.invalidData
        }
    }
    
    func fetchRandomCatImage() async throws -> [CatImage] {
        guard let url = URL(string: Constants.URLs.randomImageURL) else {
            throw NSError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NSError.invalidResponse
        }
        
        do {
            let decodedData = try JSONDecoder().decode([CatImage].self, from: data)
            return decodedData
        } catch {
            throw NSError.invalidData
        }
    }
    
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
