//
//  Pokemon.swift
//  PokemonUI
//
//  Created by syawal zt on 05/05/23.
//

import Foundation

struct PokemonApi : Codable{
    var results: [PokemonEntry]
}


class PokeApi  {
    //@Published var pokemonentry = [PokemonEntry]()
    func getData(completion:@escaping ([PokemonEntry]) -> ()) {
        guard let url = URL(string: "https://formkehadiran.com/mylist.php") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonList = try! JSONDecoder().decode(PokemonApi.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
        }.resume()
    }
}
