//
//  SliderMenu.swift
//  MoviesCopp
//
//  Created by Jesus Grimaldo on 08/10/22.
//

import SwiftUI
import Firebase

struct SliderMenu: View {
    @State private var email = ""
    @StateObject var login = FirebaseViewModel()
    @EnvironmentObject var loginShow : FirebaseViewModel
    @State var boton = false
    
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
           VStack(alignment: .trailing, spacing: 10){
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60,height: 60)
                        .clipShape(Circle())
                    Text("Usuario")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                .padding(.trailing)
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                VStack(alignment: .trailing,spacing: 45) {
                    TabButton(title: "Perfil", image: "person.fill")
                        
                    
                    TabButton(title: "Movies", image: "play.fill")
                    
                    
                    Button{
                        boton.toggle()
                    }label: {
                        NavigationLink(destination: FavoritosView()){
                            HStack(spacing: 15) {
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                Text("Favoritos")
                            }
                        }
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity,alignment: .trailing)
                    }
                    
                }
                .padding()
                .padding(.trailing)
                .padding(.top,35)
                Divider()
                    Button(action:{
                        try! Auth.auth().signOut()
                        UserDefaults.standard.removeObject(forKey: "sesion")
                        loginShow.show = false
                    }){
                        Text("Cerrar Sesion")
                            .font(.title)
                            .frame(width: 100)
                            .foregroundColor(.red)
                            .padding(.horizontal)
                    }.background(
                        Capsule().stroke(Color.red)
                    )
              }
            }
            
        }
        .padding(.bottom)
        .frame(width: getRect().width - 160)
    
        .background(Color.gray)
        
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
    @ViewBuilder
    func TabButton(title: String, image: String)->some View{
        Button{
            
        }label: {
            HStack(spacing: 15) {
                Image(systemName: "\(image)")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 20, height: 20)
                Text(title)
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity,alignment: .trailing)
        }
        
    }
}

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
