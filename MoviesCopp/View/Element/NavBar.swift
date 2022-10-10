//
//  NavBar.swift
//  MoviesCopp
//
//  Created by Jesus Grimaldo on 06/10/22.
//

import SwiftUI
import Firebase

struct NavBar: View {
    
    @Binding var index : String
    @Binding var menu : Bool
    @EnvironmentObject var loginShow : FirebaseViewModel
    
    var body: some View {
        HStack{
            Text(" Tv Show")
                .font(.title)
                .bold()
                .foregroundColor(.blue)
            Spacer()
            
            Button(action:{
                withAnimation{
                    menu.toggle()
                }
            }){
                Image(systemName: "line.horizontal.3")
                    .font(.system(size: 27))
                    .foregroundColor(.blue)
            }
        }
        .padding(.top)
        .padding()
            .background(Color.white)
    }
}


