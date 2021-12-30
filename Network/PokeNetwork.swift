//
//  PokeNetwork.swift
//  Status Tech (Pokemon Test)
//
//  Created by Fabio Avila Oliveira on 29/12/2021.
//  Copyright © 2021 Fabio Avila Oliveira. All rights reserved.
//

import Foundation

class PokeNetwork: Network {
    
    
    func fetchPoke(completion: @escaping (PokemonData?, Error?) -> Void) {
        
        let pokemonURL = "\(baseURL)\(pokeEndPoint)"
        guard let url = URL(string: pokemonURL) else {return}
        
        
        print("URL: \(url)")
        
        let urlSession = URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else { return }
            guard let statusCode = response as? HTTPURLResponse else { return }
            let decoder = JSONDecoder()
            
            if let error = error {
                print("Error Fetching Data: \(error.localizedDescription)")
                completion(nil, error)
            }
            
            if statusCode.statusCode == 200 {
                do {
                    let pokeResult = try decoder.decode(PokemonData.self, from: data)
                    completion(pokeResult, nil)
                } catch let error {
                    print("Error Decoding Data: \(error.localizedDescription)")
                    completion(nil, error)
                }
            }
            
        }
        urlSession.resume()
        
    }
}


