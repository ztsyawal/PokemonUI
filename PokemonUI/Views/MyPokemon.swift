//
//  MyPokemon.swift
//  PokemonUI
//
//  Created by syawal zt on 04/05/23.
//

import SwiftUI

struct MyPokemon: View {
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    @Environment(\.presentationMode) var presentationMode
   // var ListPokemon = ContentView()
    @State private var showingSheet = false
    //var index = 1
    
    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(searchText == "" ? pokemon: pokemon.filter( {$0.name.contains(searchText.lowercased())} )) {
                    entry in
                    
                    HStack {
                        PokemonImage(imageLink: "\(entry.url)")
                            .padding(.trailing, 40)
                        
                        
                                                NavigationLink("\(entry.name)".capitalized ,destination:
                                                               
                                                
                                                VStack{
                                                    PokemonDetailImage(imageLink: "\(entry.url)",name: "\(entry.name)")
                                                }).font(.system(size: 20))
                        
                        // PokemonImage(imageLink: "\(entry.url)")
                        // .padding(.trailing, 20))
                        
                    }
                    //
                }
                
            }
            
            .onAppear {
                PokeApi().getData() { pokemon in
                    self.pokemon = pokemon
                }
            }
            
            .navigationTitle("My Pokemon UI")
            .navigationBarTitleDisplayMode(.inline)
            //
            .toolbar {
                //                    Button () {
                //                        selection = "MyList"
                //                    } label: {
                //                        Label("MyPokemon",systemImage: "list.bullet.below.rectangle").padding(5)
                //                    }
                Button(action: {presentationMode.wrappedValue.dismiss()}) {
                    Image(systemName: "list.triangle")
                    Text("List Pokemon")
                        .padding(.vertical)
                }
                
                .padding()
                .font(.system(size: 10))
                .foregroundColor(.black)
                
                .cornerRadius(.infinity)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchText)
        .font(.system(size: 12))
    }
}

struct MyPokemon_Previews: PreviewProvider {
    static var previews: some View {
        MyPokemon()
    }
}
