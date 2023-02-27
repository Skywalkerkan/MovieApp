//
//  PopularMCollectionViewCell.swift
//  MovieApp
//
//  Created by Erkan on 24.02.2023.
//

import UIKit
import SDWebImage

class PopularMCollectionViewCell: UICollectionViewCell {

    static let identifier = "PopularMCollectionViewCell"
    

    @IBOutlet weak var yildizLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    func configure(popularMovies: MovieResult){

        imageView.sd_setImage(with: URL(string: popularMovies.posterImage)!)
        yildizLabel.text = String(format: "%.1f /10 IMDB", popularMovies.voteAverage!)
        
        
    }

}
