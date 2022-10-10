//
//  ContentView.swift
//  MoviesCopp
//
//  Created by Jesus Grimaldo on 06/10/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var  loginShow : FirebaseViewModel
    @State private var selection = 0
    
    var body: some View {
      
            return Group{
                if loginShow.show{
                  
                    TabView(selection: $selection) {
                    
                         HomeView().tabItem {
                            Label("Tv Show", systemImage: "play.tv.fill")
                        }
                        TopRatedView() .tabItem {
                            Label("Top Rated", systemImage: "play.tv.fill")
                        }
                       UpcomingView() .tabItem {
                            Label("Upcoming", systemImage: "play.tv.fill")
                        }
                    }
                    .accentColor(.blue)
                }else{
                    LoginView()
                        
                }
            }.onAppear{
                if (UserDefaults.standard.object(forKey: "sesion")) != nil{
                    loginShow.show = true
                }
            }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
