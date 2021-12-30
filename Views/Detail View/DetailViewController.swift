//
//  DetailViewController.swift
//  Status Tech (Pokemon Test)
//
//  Created by Fabio Avila Oliveira on 29/12/2021.
//  Copyright © 2021 Fabio Avila Oliveira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var lbPokeName: UILabel!
    
    var results: Pokemon?
    var name: String = ""
    var sprites: Sprite?
    var viewModel = PokeViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
    }
    
    func setUI() {
        if let results = results {
            lbPokeName.text = results.name
            //pokeImage.getImageFrom(url: results.sprites!)
        }
    }
}





