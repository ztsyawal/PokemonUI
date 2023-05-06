//
//   PokemonSelected.swift
//  PokemonUI
//
//  Created by syawal zt on 05/05/23.
//

import Foundation

struct PokemonSelected : Codable {
    var sprites: PokemonSprites
    
    var weight: Int
}
struct PokemonSelectedList : Codable {
    var sprites: PokemonSpritesList
    
    var weight: Int
}
struct PokemonSelectedDetail : Codable {
    var sprites: PokemonMoves
//    var height : Int
//    var weight: Int
}

struct PokemonSprites : Codable {
    var other: PokemonSpritesHome
}
struct PokemonSpritesList : Codable {
    var front_default: String?
}
struct PokemonSpritesHome : Codable {
    var home: PokemonSpritesHomeD
}
struct PokemonSpritesHomeD : Codable {
    var front_default: String?
}
struct PokemonMoves : Codable {
    var front_default: String?
}

class PokemonSelectedApi  {
    func getSprite(url: String, completion:@escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else { return }
        //print(url)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            //print(pokemonSprite)
            
            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
                
            }
        }.resume()
    }
    
    func getSpritelList(url: String, completion:@escaping (PokemonSpritesList) -> ()) {
        guard let url = URL(string: url) else { return }
        //print(url)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonSpriteList = try! JSONDecoder().decode(PokemonSelectedList.self, from: data)
            //print(pokemonSprite)
            
            DispatchQueue.main.async {
                completion(pokemonSpriteList.sprites)
                
            }
        }.resume()
    }
   
}

class PokemonDetailApi: ObservableObject  {
    func getDetail(url: String, completion:@escaping (PokemonMoves) -> ()) {
        guard let url = URL(string: url) else { return }
        //print(url)
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            let pokemonSprite = try! JSONDecoder().decode(PokemonSelectedDetail.self, from: data)
            //print(pokemonSprite)
            
            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
                
            }
        }.resume()
    }
   
}

