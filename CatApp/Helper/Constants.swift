//
//  Constants.swift
//  CatApp
//
//  Created by Huseyin on 02/09/2024.
//

import Foundation

struct Constants {
    struct URLs {
        static let baseURL = "https://https://api.thecatapi.com/v1/"
        static let breedsURL = baseURL + "breeds"
        static let imageURL = baseURL + "images"
        static let randomImageURL = imageURL + "/search/"
        static let spesificImageURL = { (imageID: String) in
            return randomImageURL + imageID
        }
    }
}
