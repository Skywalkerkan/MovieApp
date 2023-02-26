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
        NetworkManager.shared.request(type: Movies.self, url: Route.popular.path, method: .get) { response in
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
    
    func getTopRatedMovies(completion: @escaping(Movies?, Error?) -> Void){
        NetworkManager.shared.request(type: Movies.self, url: Route.topRated.path, method: .get) { response in
            switch response{
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
                print("kekimsi")
            }
        }
    }
    
    func getUpcomingMovies(completion: @escaping(Movies?, Error?) -> Void){
        
        NetworkManager.shared.request(type: Movies.self, url: Route.upcoming.path, method: .get) { response in
            switch response{
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
                print("kekiğimsi")
            }
        }
        
        
    }
    
    func getSearchingMovies(queryParameter: String, completion: @escaping(Movies?, Error?) -> Void){
        NetworkManager.shared.request(type: Movies.self, url: Route.searching.path + queryParameter, method: .get) { response in
            switch response{
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error)
                print("kekiğimsi")
            }
        }
    }
    
}
