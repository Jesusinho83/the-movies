//
//  MovieView.swift
//  MoviesCopp
//
//  Created by Jesus Grimaldo on 08/10/22.
//

import SwiftUI

struct MovieView: View {
    
    @State var original_title : String
    @State var poster_path : String
    @State var overview: String
    @State var favoritos: Bool = false
    @State var release_date : String
    @State var vote_average: Double
    @StateObject var guardar = FirebaseViewModel()
    @State private var show = false
    let id: Int
    private let animationDuratio: Double = 0.1
    private var animationScala: CGFloat {
        favoritos ? 0.7 : 1.3
    }
    @State private var animate = false
    
    @StateObject var movies : MoviesViewModel
    
    var body: some View {
        ScrollView{
        VStack{
            VStack{
                CardMovieView(poster: poster_path){
                    show.toggle()
                }
                .sheet(isPresented: $show) {
                    TrailerView(movies: movies, id: String(id))
                }
                
            }
            Spacer()
            Divider()
            VStack{
                HStack{
                    Text("Favoritos")
                        .font(.title2)
                        .foregroundColor(.red)
                    Spacer()
                    Button{
                        guardar.save(titulo: original_title, portada: poster_path, descripcion: overview, favoritos: favoritos, fecha: release_date, calificacion: vote_average) { done in
                            
                            
                        }
                        self.animate = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + self.animationDuratio, execute: {
                            self.animate = false
                            UserDefaults.standard.set(true, forKey: "sesion")
                            self.favoritos.toggle()
                        })
                        
                       
                            print("Favoritos")
                        
                    }label: {
                    
                        Image(systemName: favoritos ? "star.fill" : "star")
                                .resizable()
                                .frame(width: 50)
                                .foregroundColor(favoritos ? .yellow : .gray)
                    
                    }.scaleEffect(animate ? animationScala : 1)
                        .animation(.easeIn(duration: animationDuratio))
                    
                }
                Divider()
                HStack{
                    Text("Fecha de Lanzamiento:")
                        .font(.title2)
                        .foregroundColor(.red)
                    Text(release_date)
                        .font(.subheadline)
                        .foregroundColor(.blue)
                    Spacer()
                    
                    Text("Calificacion")
                        .font(.title2)
                        .foregroundColor(.red)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text(String(vote_average))
                        .foregroundColor(.yellow)
                        .bold()
                }
                Divider()
                
                Text("Descripcion")
                    .font(.title2)
                    .foregroundColor(.red)
                    .padding(.leading)
                Text(overview)
                    .font(.title3)
                    .foregroundColor(.blue)
            }
            
        }.navigationTitle(original_title)
      }
    }
}

