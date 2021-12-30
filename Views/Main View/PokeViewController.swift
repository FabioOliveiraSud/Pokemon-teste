//
//  ViewController.swift
//  Status Tech (Pokemon Test)
//
//  Created by Fabio Avila Oliveira on 29/12/2021.
//  Copyright © 2021 Fabio Avila Oliveira. All rights reserved.
//

import UIKit

class PokeViewController: UIViewController {

    @IBOutlet weak var pokeTableView: UITableView!
    
    var viewModel = PokeViewModel()
    let cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        loadData()
    }
    
    func setUI() {
        self.title = "Pokémons"
        pokeTableView.delegate = self
        pokeTableView.dataSource = self
        pokeTableView.tableFooterView = UIView()
        
    }
    
    func loadData() {
        viewModel.fetchPoke { didFinishLoading in
            if let finishedLoading = didFinishLoading, finishedLoading {
                DispatchQueue.main.async {
                    self.pokeTableView.reloadData()
                }
            }
        }
    }
}

extension PokeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PokeTableViewCell else { return UITableViewCell() }
        
        let pokemon = viewModel.pokemons[indexPath.row]
        cell.pokemons = pokemon
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        guard let detailVC = storyboard.instantiateViewController(withIdentifier: "detailVC") as? DetailViewController else { return }
        
        guard let cell = tableView.cellForRow(at: indexPath) as? PokeTableViewCell else { return }
        detailVC.results = cell.pokemons
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
}
