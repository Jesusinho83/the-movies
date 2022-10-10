//
//  LoginView.swift
//  MoviesCopp
//
//  Created by Jesus Grimaldo on 06/10/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var pass = ""
    @StateObject var login = FirebaseViewModel()
    @EnvironmentObject var loginShow : FirebaseViewModel
 
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [  .gray, .purple]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
           
            VStack{
                Text("Movies")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                SecureField("Contraseña", text: $pass)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom, 20)
                
                Button(action:{
                    login.login(email: email, pass: pass) { (done) in
                        if done{
                            UserDefaults.standard.set(true, forKey: "sesion")
                            loginShow.show.toggle()
                        }
                    }
                }){
                    Text("Entrar")
                        .font(.title)
                        .frame(width: 200)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        
                }.background(
                 Capsule()
                    .stroke(Color.white)
                )
                
                Divider()
                
                Button(action:{
                    login.createUser(email: email, pass: pass) { (done) in
                        if done{
                            UserDefaults.standard.set(true, forKey: "sesion")
                            loginShow.show.toggle()
                        }
                    }
                }){
                    Text("Registrarse")
                        .font(.title)
                        .frame(width: 200)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        
                }.background(
                 Capsule()
                    .stroke(Color.white)
                )
                
                
            }.padding(.all)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
