//
//  HomeView.swift
//  MoviesCopp
//
//  Created by Jesus Grimaldo on 06/10/22.
//

import SwiftUI
import Firebase


struct HomeView: View {
    
    
    @State private var widthMenu = UIScreen.main.bounds.width
    @EnvironmentObject var loginShow : FirebaseViewModel
    @StateObject var movies = MoviesViewModel()
    @State private var showMenu : Bool = false
    @State var boton = false
  
    
    let gridItem : [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    
    var body: some View {
        
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [  .gray, .purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.top)
                
                ScrollView(){
                    LazyVGrid(columns: gridItem, spacing: 50) {
                        ForEach(movies.dataMovies, id: \.id){ item in
                            VStack{
                                Button(action:{
                                    boton.toggle()
                                    print("ir")
                                }){
                                  
                                    NavigationLink(destination: MovieView(original_title: item.original_title,poster_path: item.poster_path ?? "",overview: item.overview,release_date: item.release_date, vote_average: item.vote_average, id: item.id, movies: movies)) {
                                            VStack{
                                                CardsVIew(poster: item.poster_path ?? "")
                                                Text(item.original_title)
                                                    .font(.title)
                                                    .foregroundColor(.blue)
                                                    .bold()
                                                HStack{
                                                    Text(item.release_date)
                                                        .font(.subheadline)
                                                        .foregroundColor(.black)
                                                        .bold()
                                                        .padding()
                                                    Image(systemName: "star.fill")
                                                        .foregroundColor(.yellow)
                                                    Text(String(item.vote_average))
                                                        .foregroundColor(.yellow)
                                                        .bold()
                                                }
                                                Text(item.overview)
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
                   
                }
                .navigationTitle("Movies")
                .task {
                    await movies.fetch()
                }
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
          
        }
    }
}




