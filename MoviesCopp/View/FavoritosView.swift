//
//  FavoritosView.swift
//  MoviesCopp
//
//  Created by Jesus Grimaldo on 09/10/22.
//

import SwiftUI

struct FavoritosView: View {
    @State private var widthMenu = UIScreen.main.bounds.width
    @EnvironmentObject var loginShow : FirebaseViewModel
    @StateObject var movies = MoviesViewModel()
    @State private var showMenu : Bool = false
    @State var boton = false
    
    
    let gridItem : [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    
    var body: some View {
        
            ZStack{
                LinearGradient(gradient: Gradient(colors: [  .gray, .purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.top)
                
                ScrollView(){
                    LazyVGrid(columns: gridItem, spacing: 50) {
                        ForEach(loginShow.datos, id: \.id){ item in
                            VStack{
                                Button(action:{
                                    boton.toggle()
                                    print("ir")
                                }){
                                  
                                   
                                            VStack{
                                                CardsVIew(poster: item.portada )
                                                Text(item.titulo)
                                                    .font(.title)
                                                    .foregroundColor(.blue)
                                                    .bold()
                                                HStack{
                                                    Text(item.fecha)
                                                        .font(.subheadline)
                                                        .foregroundColor(.black)
                                                        .bold()
                                                        .padding()
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.yellow)
                                                    Text(String(item.calificacion))
                                                        .foregroundColor(.yellow)
                                                        .bold()
                                                }
                                                Text(item.descripcion)
                                                    .font(.caption)
                                                    .lineLimit(4)
                                                    .foregroundColor(.white)
                                                    .multilineTextAlignment(.leading)
                                            }
                                        
                                    
                                }
                               
                            }
                        }
                    }
                   
                }
                .navigationTitle("Favoritos")
              
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action:{
                            self.showMenu.toggle()
                        }){
                            Image(systemName: "line.horizontal.3")
                                .font(.system(size: 27))
                                .foregroundColor(.black)
                        }
                    }
                }
            
                GeometryReader{ _ in
                    SliderMenu()
                        .offset(x: showMenu ? 0 : UIScreen.main.bounds.width )
                }
           }
            .onAppear {
               loginShow.getData()
        }
       
    }
}



