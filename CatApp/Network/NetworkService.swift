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
    
    //MARK: - Cat
    func fetchRandomCatImage() async throws -> [CatImage] {
        return try await fetch(urlString: Constants.URLs.randomImageURL)
    }
    
    func fetchSpesificCatImage(id: String) async throws -> CatImage {
        return try await fetch(urlString: Constants.URLs.imageURL + id)
    }
    
    
    func fetchBreeds() async throws -> [Breed] {
        return try await fetch(urlString: Constants.URLs.breedsURL)
    }
    
    func likeCatImage(catImageID: String, subID: String? = nil) async throws -> Bool {
        guard let url = URL(string: Constants.URLs.favouritesURL) else { throw NSError.invalidURL }
        
        let payload: [String: Any] = [
            "image_id": catImageID,
            "sub_id": subID ?? "default_user1"
        ]
        
        let jsonData = try JSONSerialization.data(withJSONObject: payload, options: [])
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("YOUR_API_KEY", forHTTPHeaderField: "x-api-key")
        request.httpBody = jsonData
        
        // Send the POST request
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Check for successful response
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NSError.invalidResponse
        }
        
        
        
        return true // Successful response
    }
    
    func fetchLikedCats() async throws -> [FavouriteCatImage] {
        return try await fetch(urlString: Constants.URLs.favouritesURL + "?sub_id=" + Constants.URLs.currentUserID + "&api_key=YOUR_API_KEY" )
    }
}
