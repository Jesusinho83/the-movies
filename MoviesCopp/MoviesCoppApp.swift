//
//  MoviesCoppApp.swift
//  MoviesCopp
//
//  Created by Jesus Grimaldo on 06/10/22.
//

import SwiftUI

@main
struct MoviesCoppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    
    var body: some Scene {
        let login = FirebaseViewModel()
        WindowGroup {
            ContentView().environmentObject(login)
        }
    }
}
