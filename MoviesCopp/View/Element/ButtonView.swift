//
//  ButtonView.swift
//  MoviesCopp
//
//  Created by Jesus Grimaldo on 06/10/22.
//

import SwiftUI

struct ButtonView: View {
    
    @Binding var index : String
    @Binding var menu : Bool

    
    var title : String
    
    
    var body: some View {
        Button(action:{
            withAnimation{
                index = title
                menu.toggle()
            }
        }){
            Text(title)
                .font(.title)
                .fontWeight(index == title ? .bold :  .none)
                .foregroundColor(index == title ? .blue : Color.blue.opacity(0.6))
            
        }
    }
}

