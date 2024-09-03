//
//  Fact.swift
//  CatApp
//
//  Created by Huseyin on 03/09/2024.
//

import Foundation

struct Fact: Codable {
    let data: [String]
}

let fact1 = Fact(
    data: ["The catnip plant contains an oil called hepetalactone which does for cats what marijuana does to some people. Not all cats react to it those that do appear to enter a trancelike state. A positive reaction takes the form of the cat sniffing the catnip, then licking, biting, chewing it, rub & rolling on it repeatedly, purring, meowing & even leaping in the air."]
)
