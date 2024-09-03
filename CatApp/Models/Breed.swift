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


let breed1: Breed = Breed(
    id: "abys",
    name: "Abyssinian",
    temperament: "Active, Energetic, Independent, Intelligent, Gentle",
    description: "The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.",
    referenceImageID: "0XYvRd7oD"
)

let breed2: Breed = Breed(
    id: "aege",
    name: "Aegean",
    temperament: "Affectionate, Social, Intelligent, Playful, Active",
    description: "Native to the Greek islands known as the Cyclades in the Aegean Sea, these are natural cats, meaning they developed without humans getting involved in their breeding. As a breed, Aegean Cats are rare, although they are numerous on their home islands. They are generally friendly toward people and can be excellent cats for families with children.",
    referenceImageID: "ozEvzdVM-"
)

let breed3: Breed = Breed(
    id: "abob",
    name: "American Bobtail",
    temperament: "Intelligent, Interactive, Lively, Playful, Sensitive",
    description: "American Bobtails are loving and incredibly intelligent cats possessing a distinctive wild appearance. They are extremely interactive cats that bond with their human family with great devotion.",
    referenceImageID: "hBXicehMA"
)

let breeds: [Breed] = [breed1, breed2, breed3]
