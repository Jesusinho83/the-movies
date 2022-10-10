//
//  TrailerView.swift
//  MoviesCopp
//
//  Created by Jesus Grimaldo on 08/10/22.
//

import SwiftUI
import WebKit

struct TrailerView: View {
    
    @StateObject var movies : MoviesViewModel
    
    @State var id : String
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VideoView(videoId: movies.key)
                .frame(minHeight: 0, maxHeight: UIScreen.main.bounds.height * 0.3 )
                .cornerRadius(12)
                .padding(.all)
                .task {
                    await movies.fetchVideo(id: id)
                }
        }
    }
}


struct VideoView : UIViewRepresentable{
    
    let videoId : String
    
    func makeUIView(context: Context) -> WKWebView{
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoId)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: url))
    }
}
