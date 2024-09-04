//
//  Image.swift
//  CatApp
//
//  Created by Huseyin on 02/09/2024.
//

import Foundation

struct CatImage: Codable {
    let id: String
    let url: String
    let breeds: [Breed]?
    let width: Int
    let height: Int
}
