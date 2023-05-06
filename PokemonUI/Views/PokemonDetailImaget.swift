//
//  PokemoenDetailMyList.swift
//  PokemonUI
//
//  Created by syawal zt on 06/05/23.
//

import SwiftUI

struct PokemonDetailImage: View {
    var imageLink = ""
    var name = ""
    @State private var pokemonSprite = ""
    
    var body: some View {
        VStack(spacing:80){
            Text("Detail My Pokemon").font(.system(size: 30)).bold().padding(.top)
            VStack (spacing:50){
                AsyncImage(url: URL(string: pokemonSprite))
                    
                { image in
                    image
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)
                    .scaledToFit()
                        .frame(width: 170, height: 170)
                    
                    
                } placeholder: {
                    ProgressView()
                        .frame(width: 170, height:170)
                    
                    }
                    .background(.thinMaterial)
                    .clipShape(Rectangle())
                    .cornerRadius(20)
                    .padding(EdgeInsets(top: 30, leading: 50, bottom: 20, trailing: 50))
                    
                
                
                .onAppear {
                    let loadedData = UserDefaults.standard.string(forKey: imageLink)
                        getSprite(url: loadedData!)
                        
                }
                VStack(spacing: 0) {
                    Text("**Name**: \(name)").font(.system(size: 20))
                    
                }.padding(EdgeInsets(top: 60, leading: 50, bottom: 50, trailing: 50))
            }.background(Gradient(colors: [.blue, .purple]))
                .cornerRadius(10)
            
        VStack(){
            HStack{
                Button(action: {}) {
                    Text("Rename Pokemon").padding(5)
        
                }.padding(10)
                    .background(.green)
                    .foregroundColor(.black)
                    .cornerRadius(5)
                Button(action: {}) {
                    Text("Move Pokemon").padding(5)
        
                }.padding(10)
                    .background(.red)
                    .foregroundColor(.black)
                    .cornerRadius(5)
                
            }
            
        }.padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
               
                
        }
    }
    
    
    func getSprite(url: String) {
        var tempSprite: String?
        PokemonSelectedApi().getSprite(url: url) { sprite in
            tempSprite = sprite.other.home.front_default
            self.pokemonSprite = tempSprite ?? "placeholder"
        }
    }
}

struct PokemonDetailImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailImage()
            .previewInterfaceOrientation(.portrait)
    }
}
