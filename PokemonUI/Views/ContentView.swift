//
//  ContentView.swift
//  PokemonUI
//
//  Created by syawal zt on 04/05/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var myPokemon = MyPokemon()
    @State private var selection: String? = nil
    @State private var showingSheet = false
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        
        NavigationView {
            
            ScrollView {
                NavigationLink(destination: MyPokemon(), tag: "MyList", selection: $selection) { EmptyView() }
                VStack(){
                    
                    LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                        ForEach(vm.filteredPokemon) { pokemon in
                            NavigationLink(destination: PokemonDetailView(pokemon: pokemon)
                            ) {
                                PokemonView(pokemon: pokemon)
                            }
                            
                        }
                        
                    }
                        //.padding(EdgeInsets(top: 20, leading: 5, bottom: 10, trailing: 5))
                        //.cornerRadius(35)
                    
                }
                
                .animation(.easeInOut(duration: 0.3), value: vm.filteredPokemon.count)
                .navigationTitle("PokemonUI")
                .toolbar {
//                    Button () {
//                        selection = "MyList"
//                    } label: {
//                        Label("MyPokemon",systemImage: "list.bullet.below.rectangle").padding(5)
//                    }
                    Button(action: {showingSheet.toggle()}) {
                        Image(systemName: "list.bullet.below.rectangle")
                            Text("My Pokemon")
                                .padding(.vertical)
                                }
                                .fullScreenCover(isPresented: $showingSheet) {
                                    myPokemon
                                }
                        .padding()
                        .font(.system(size: 10))
                        .foregroundColor(.black)

                        .cornerRadius(.infinity)
                }
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $vm.searchText)
        }
        .environmentObject(vm)
    }
}
func Mypoke() -> AnyView {
    print("test")
    return AnyView(MyPokemon().animation(.easeIn))
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

