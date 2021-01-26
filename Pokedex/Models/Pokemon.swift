//
//  Pokemon.swift
//  Pokedex
//
//  Created by Benjamin Tincher on 1/26/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import Foundation

struct Pokemon: Codable {
    let name: String
    let id: Int
    let sprites: Sprites
}

struct Sprites: Codable {
    let front_shiny: URL
}
