//
//  FavouriteCatImage.swift
//  CatApp
//
//  Created by Huseyin on 07/09/2024.
//

import Foundation

struct FavouriteCatImage: Codable, Identifiable {
    let id: Int
    let userID: String
    let imageID: String
    let subID: String
    let createdAt: String
    let image: CatImage
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case imageID = "image_id"
        case subID = "sub_id"
        case createdAt = "created_at"
        case image
    }
}

/*
"id": 232486845,
        "user_id": "66tifh",
        "image_id": "56i",
        "sub_id": "default_user1",
        "created_at": "2024-09-06T16:46:51.000Z",
        "image": {
            "id": "56i",
            "url": "https://cdn2.thecatapi.com/images/56i.jpg"
        }
 /**/*/
