//
//  PokemonModel.swift
//  PokemonUI
//
//  Created by syawal zt on 04/05/23.
//

import Foundation


struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    //let moves: String
    let url: String
    
    static var samplePokemon = Pokemon(name: "", url: "")
    
}


struct DetailPokemon: Codable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    
    let moves: [DetailMove]
    let types: [DetailType]
}
struct DetailMove: Codable {
    let move: DetailMoveNme
}
struct DetailMoveNme: Codable {
    let name: String
}
struct DetailType: Codable {
    let type: DetailMoveNme
}
struct DetailTypeNme: Codable {
    let name: String
}
