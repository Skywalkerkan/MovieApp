//
//  SearchTableViewCell.swift
//  MovieApp
//
//  Created by Erkan on 26.02.2023.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    static let identifier = "SearchTableViewCell"
    
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    
    
    func cellConfigure(movies: MovieResult){
        
        movieNameLabel.text = movies.title
        
        
    }
    
    
    
}
