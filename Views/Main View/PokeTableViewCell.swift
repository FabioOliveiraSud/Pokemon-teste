//
//  PokeTableViewCell.swift
//  Status Tech (Pokemon Test)
//
//  Created by Fabio Avila Oliveira on 29/12/2021.
//  Copyright © 2021 Fabio Avila Oliveira. All rights reserved.
//

import UIKit

class PokeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbPokeName: UILabel!
    
    var pokemons: Pokemon? {
        didSet{
            guard let pokemons = pokemons else { return }
            fillCellWith(pokemons: pokemons)
        }
    }
    
    func fillCellWith(pokemons: Pokemon) {
        lbPokeName.text = pokemons.name
        
    }
    
}
    
