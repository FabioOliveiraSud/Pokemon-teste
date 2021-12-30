//
//  PokeViewModel.swift
//  Status Tech (Pokemon Test)
//
//  Created by Fabio Avila Oliveira on 29/12/2021.
//  Copyright © 2021 Fabio Avila Oliveira. All rights reserved.
//

import Foundation

class PokeViewModel {
    
    let network = PokeNetwork()
    var pokemons: [Pokemon] = []
    
    func fetchPoke(completion: @escaping (Bool?) -> Void) {
        network.fetchPoke { pokemonData, error in
            if error == nil {
                guard let results = pokemonData?.results else {return}
                self.pokemons = results
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}
