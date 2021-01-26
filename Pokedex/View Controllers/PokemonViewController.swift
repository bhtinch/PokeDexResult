//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Benjamin Tincher on 1/26/21.
//  Copyright © 2021 Warren. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController {
    
    //  MARK: Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var pokeIDLabel: UILabel!
    
    //  MARK: Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    //  MARK: Helper Functions
    func fetchSpriteAndUpdateViewsFor(pokemon: Pokemon) {
        PokemonController.fetchSpriteFor(pokemon: pokemon) { (result) in
            DispatchQueue.main.async {
                switch result{
                case .success(let image):
                    self.pokeImageView.image = image
                    self.pokeNameLabel.text = pokemon.name.capitalized
                    self.pokeIDLabel.text = String(pokemon.id)
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
}   //  End of Class

extension PokemonViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text?.lowercased() else { return }
        
        PokemonController.fetchPokemon(searchTerm: searchTerm) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let pokemon):
                    self.fetchSpriteAndUpdateViewsFor(pokemon: pokemon)
                case .failure(let error):
                    self.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
}
