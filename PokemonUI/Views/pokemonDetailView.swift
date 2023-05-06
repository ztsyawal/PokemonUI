//
//  pokemonDetailView.swift
//  PokemonUI
//
//  Created by syawal zt on 04/05/23.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var vm: ViewModel
    //@EnvironmentObject var vm1: PokemonModel

    
    let pokemon: Pokemon
    let dimensions: Double = 150
    let frames: Double = 200
    
    var body: some View {
        VStack{
            VStack {
                
                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(vm.getPokemonIndex(pokemon: pokemon)).png")) { image in
                    image
                        .resizable()
                        .aspectRatio(0.5, contentMode: .fit)
                    //.scaledToFit()
                        .frame(width: frames, height: frames)
                    
                    
                } placeholder: {
                    ProgressView()
                        .frame(width: frames, height:frames)
                    
                }
                .background(.thinMaterial)
                .clipShape(Rectangle())
                .cornerRadius(20)
                .padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50))
                
                
                VStack(spacing: 10) {
                    Text("**ID**: \(vm.pokemonDetails?.id ?? 0)")
                    Text("**Name**: \(vm.pokemonDetails?.name ?? "Pokemon")")
                    Text("**Move**: \(vm.pokemonDetailsMovesName)")
                    Text("**Type**: \(vm.pokemonDetailsTypesName)")
                    Text("**Weight**: \(vm.formatHW(value: vm.pokemonDetails?.weight ?? 0)) KG")
                    Text("**Height**: \(vm.formatHW(value: vm.pokemonDetails?.height ?? 0)) M")
                    
                    
                }.padding(EdgeInsets(top: 20, leading: 50, bottom: 20, trailing: 50))
                
            }.background(Gradient(colors: [.blue, .purple]))
                .cornerRadius(10)
                .onAppear {
                    vm.getDetails(pokemon: pokemon)
                }
        }
        
        VStack(){
            Button(action: {}) {
                Image("pngwing").resizable().frame(width: 115,height: 115)
    
                }
        }.padding(50)
        
    }
    
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon)
            .environmentObject(ViewModel())
        
    }
}

