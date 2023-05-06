//
//  PokemonImage.swift
//  PokemonUI
//
//  Created by syawal zt on 05/05/23.
//

import SwiftUI

struct PokemonImage: View {
    var imageLink = ""
    @State private var pokemonSprite = ""
    @State private var PokemonSpritesList = ""
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: PokemonSpritesList))
            
                .frame(width: 75, height: 75)
                .onAppear {
                    let loadedData = UserDefaults.standard.string(forKey: imageLink)
                        getSprite(url: loadedData!)
                        
                }
                .clipShape(Circle())
                .foregroundColor(Color.gray.opacity(0.60))
                .scaledToFit()
        }
    }
    
    
    func getSprite(url: String) {
        var tempSprite: String?
        PokemonSelectedApi().getSpritelList(url: url) { sprite in
            tempSprite = sprite.front_default
            self.PokemonSpritesList = tempSprite ?? "placeholder"
        }
    }
}

struct PokemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImage()
            .previewInterfaceOrientation(.portrait)
    }
}

