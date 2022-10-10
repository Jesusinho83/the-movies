//
//  CardMovieView.swift
//  MoviesCopp
//
//  Created by Jesus Grimaldo on 08/10/22.
//

import SwiftUI

struct CardMovieView: View {
    var poster : String
    var action : () -> Void
   
    
    var body: some View{
        VStack(alignment: .leading) {
            ZStack{
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200/\(poster)")){ image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 5)
                    .frame(width: 400, height: 400)
                Divider()
                HStack{
                    Text("Reproducir Trailer")
                        .font(.subheadline)
                        .foregroundColor(.red)
                    Image(systemName: "play.circle.fill")
                        .frame(width: 80, height: 80)
                }
            }placeholder: {
                Image("no imagen")
            }
            
          }
        }.padding(.all)
            .onTapGesture {
                action()
            }
    }
    
    
}
