//
//  videoModel.swift
//  MoviesCopp
//
//  Created by Jesus Grimaldo on 08/10/22.
//

import Foundation

struct videoModel: Codable {
    let id : Int
    let results: [videoResult]
    
}
      

    
    struct videoResult: Codable {
        
        let key : String
        let type : String
    }
