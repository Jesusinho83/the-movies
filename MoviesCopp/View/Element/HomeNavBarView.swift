//
//  HomeNavBarView.swift
//  MoviesCopp
//
//  Created by Jesus Grimaldo on 07/10/22.
//

import SwiftUI
import Firebase


struct HomeNavBar: View{
    @State private var menu = false
    @State private var index = "Movies"
    @State private var widthMenu = UIScreen.main.bounds.width
    @EnvironmentObject var loginShow : FirebaseViewModel
    
    var body: some View{
        
        VStack{
            NavBar(index: $index, menu: $menu)
        
        if menu{
            HStack{
                Spacer()
                VStack{
                    HStack{
                        Spacer()
                        Button(action:{
                            withAnimation{
                                menu.toggle()
                            }
                        }){
                            Image(systemName: "xmark")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.blue)
                        }
                    }.padding()
                        .padding(.top, 50)
                    VStack(alignment: .trailing){
                        ButtonView(index: $index, menu: $menu, title: "Movies")
                        ButtonView(index: $index, menu: $menu, title: "Favoritos")
                        ButtonView(index: $index, menu: $menu, title: "Perfil")
                        Spacer()
                        Button(action:{
                            try! Auth.auth().signOut()
                            UserDefaults.standard.removeObject(forKey: "sesion")
                            loginShow.show = false
                        }){
                            Text("Cerrar Sesion")
                                .font(.title)
                                .frame(width: 200)
                                .foregroundColor(.red)
                                .padding(.horizontal)
                        }.background(
                            Capsule().stroke(Color.red)
                        )
                    }
                    Spacer()
                }
                .frame(width: widthMenu - 150)
                .background(Color.white)
            }
        }
    }
        
    }
    
}


