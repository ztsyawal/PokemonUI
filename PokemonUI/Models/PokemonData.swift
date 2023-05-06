//
//  PokemonData.swift
//  PokemonUI
//
//  Created by syawal zt on 05/05/23.
//

import Foundation
import SwiftUI

struct PokemonEntry : Codable, Identifiable  {
    let id = UUID()
    var name: String
    var url: String
}
