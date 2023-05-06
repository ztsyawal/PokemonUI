//
//  ViewModel.swift
//  PokemonUI
//
//  Created by syawal zt on 04/05/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: DetailPokemon?
    @Published var pokemonDetailsMovesName = ""
    @Published var pokemonDetailsTypesName = ""
    @Published var searchText = ""
    
    // Used with searchText to filter pokemon results
    var filteredPokemon: [Pokemon] {
                return searchText == "" ? pokemonList : pokemonList.filter { $0.name.contains(searchText.lowercased()) }
            }
    
    init() {
        self.pokemonList = pokemonManager.getPokemon()
    }
    
    
    // Get the index of a pokemon ( index + 1 = pokemon id)
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    // Get specific details for a pokemon
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        
        self.pokemonDetails = DetailPokemon(id: 0,name: "", height: 0, weight: 0,moves:[],types: [])
        //self.pokemonDetailsName = DetailMoveNme(name: "")
        
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
                //print("tessssss\(String(describing: self.pokemonDetails?.moves[0].move.name))")
                self.pokemonDetailsMovesName =  self.pokemonDetails?.moves[0].move.name ?? "Moves"
                self.pokemonDetailsTypesName =  self.pokemonDetails?.types[0].type.name ?? "Types"
               // print(pokemonDetailsMovesName)
                //let decodedData = try JSONDecoder().decode(pokemonDetails?.moves.self)
               // print("Test\(String(describing: self.pokemonDetails?.moves.move))")
                
            }
        }
    }
    
    // Formats the Height or the Weight of a given pokemon
    func formatHW(value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        
        return string
    }
}
