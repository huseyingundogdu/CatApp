//
//  Breed.swift
//  CatApp
//
//  Created by Huseyin on 02/09/2024.
//

import Foundation

struct Breed: Codable, Identifiable {
    let id: String
    let name: String
    let temperament: String
    let description: String
    let referenceImageID: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case temperament
        case description
        case referenceImageID = "reference_image_id"
    }
}
