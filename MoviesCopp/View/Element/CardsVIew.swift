//
//  CardsVIew.swift
//  MoviesCopp
//
//  Created by Jesus Grimaldo on 08/10/22.
//

import SwiftUI

struct CardsVIew: View {
    var poster : String
    
   
    
    var body: some View{
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w200/\(poster)")){ image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 5)
                    .frame(width: 150, height: 200)
                
            }placeholder: {
                Image("no imagen")
            }
          
          
        }.padding(.all)
           
    }
    
    
}
