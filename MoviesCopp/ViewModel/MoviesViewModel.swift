//
//  MoviesViewModel.swift
//  MoviesCopp
//
//  Created by Jesus Grimaldo on 07/10/22.
//

import Foundation

@MainActor
class MoviesViewModel: ObservableObject{
    
    @Published var dataMovies: [Result] = []
    
    
    @Published var key = ""
    
    func fetch() async {
        do{
            
            let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=f6a11e07af9f1d38e7f16e23c4d88065&language=en-US&page=1"
            guard let url = URL(string: urlString) else { return }
            let (data,_) = try await URLSession.shared.data(from: url)
            let json = try JSONDecoder().decode(MovieModel.self, from: data)
            self.dataMovies = json.results
            print(json.results)
            
        }catch let error as NSError {
            print("Error en la api:", error.localizedDescription)
        }
    }
    
    
    func fetchVideo(id:String) async {
        do{
            
            let urlString = "https://api.themoviedb.org/3/movie/\(id)/videos?api_key=f6a11e07af9f1d38e7f16e23c4d88065&language=en-US"
            guard let url = URL(string: urlString ) else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            let json = try JSONDecoder().decode(videoModel.self, from: data)
            let res = json.results.filter({$0.type.contains("Trailer")})
            self.key = res.first?.key ?? ""
           
            
        }catch let error as NSError {
            print("Error en la api:", error.localizedDescription)
        }
    }
    func fetchTop() async {
        do{
            
            let urlString = "https://api.themoviedb.org/3/movie/top_rated?api_key=f6a11e07af9f1d38e7f16e23c4d88065&language=en-US&page=1"
            guard let url = URL(string: urlString) else { return }
            let (data,_) = try await URLSession.shared.data(from: url)
            let json = try JSONDecoder().decode(MovieModel.self, from: data)
            self.dataMovies = json.results
            print(json.results)
            
        }catch let error as NSError {
            print("Error en la api:", error.localizedDescription)
        }
        
    }
    
    func fetchUpc() async{
        do{
            
            let urlString = "https://api.themoviedb.org/3/movie/upcoming?api_key=f6a11e07af9f1d38e7f16e23c4d88065&language=en-US&page=1"
            guard let url = URL(string: urlString) else { return }
            let (data,_) = try await URLSession.shared.data(from: url)
            let json = try JSONDecoder().decode(MovieModel.self, from: data)
            self.dataMovies = json.results
            print(json.results)
            
        }catch let error as NSError {
            print("Error en la api:", error.localizedDescription)
        }
    }
    
}
