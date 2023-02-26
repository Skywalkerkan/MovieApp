//
//  Route.swift
//  MovieApp
//
//  Created by Erkan on 24.02.2023.
//

import Foundation
    
enum Route: String{

    
    case popular = "movie/popular"
    case topRated = "movie/top_rated"
    case upcoming = "movie/upcoming"
    case searching = "search/movie"

    
    
    var path: String{
        switch self{
        case.popular:
            return NetworkHelper.shared.requestUrl(url: Route.popular.rawValue)
        case .topRated:
            return NetworkHelper.shared.requestUrl(url: Route.topRated.rawValue)
        case .upcoming:
            return NetworkHelper.shared.requestUrl(url: Route.upcoming.rawValue)
        case .searching:
            return NetworkHelper.shared.requestUrl(url: Route.searching.rawValue)
        }
        
    }
    
    
}


class NetworkHelper{
    
    static let shared = NetworkHelper()
    
    private let baseUrl = "https://api.themoviedb.org/3/"
    private let apiKey = "90d27f19dae70ecf66feab87d4811474"
    
    
    func requestUrl(url: String) -> String{
        baseUrl + url + "?api_key=" + apiKey
    }
    
    /*func requestSearchUrl(url: String) -> String{
        baseUrl + url + "?api_key=" + apiKey
    }*/
}
