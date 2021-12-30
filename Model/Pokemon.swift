//
//  Pokemon.swift
//  Status Tech (Pokemon Test)
//
//  Created by Fabio Avila Oliveira on 29/12/2021.
//  Copyright © 2021 Fabio Avila Oliveira. All rights reserved.
//

import Foundation

struct PokemonData: Codable {
    
    let results: [Pokemon]
    
}

struct Pokemon: Codable {
    
    let name: String?
    let sprites: String?
    
}

struct Sprite: Codable {
    
    let front_default: String
    
}
