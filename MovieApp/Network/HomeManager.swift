//
//  HomeManager.swift
//  MovieApp
//
//  Created by Erkan on 24.02.2023.
//

import Foundation




class HomeManager {
    
    static let shared = HomeManager()
    
    func getCategoryMovies(completion: @escaping(Movies?, Error?) -> Void){
        NetworkManager.shared.request(type: Movies.self, url: Route.topRated.path, method: .get) { response in
            switch response{
            case .success(let data):
                completion(data, nil)
               // print(data)
            case .failure(let error):
                completion(nil, error)
                print("kekekekkee")
            }
        }
    }
    
}
