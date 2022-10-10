//
//  VideoViewModel.swift
//  MoviesCopp
//
//  Created by Jesus Grimaldo on 08/10/22.
//

import Foundation

@MainActor
class VideoViewModel: ObservableObject{
    
    
   // @Published var dataVideoMovies: [videoResult] = []
    
    func fetchVideo(id:String) async {
        do{
            
            let urlString = "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=f6a11e07af9f1d38e7f16e23c4d88065&language=en-US"
            guard let url = URL(string: urlString ) else { return }
            let (data,_) = try await URLSession.shared.data(from: url)
            let json = try JSONDecoder().decode(videoModel.self, from: data)
            let res = json.results.filter({$0.type.contains("Trailer")})
            self.key = res.first?.key ?? ""
        }catch let error as NSError {
            print("Error en la api:", error.localizedDescription)
        }
    }
    
}
