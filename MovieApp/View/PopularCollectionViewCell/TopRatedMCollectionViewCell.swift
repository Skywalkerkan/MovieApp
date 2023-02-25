//
//  TopRatedMCollectionViewCell.swift
//  MovieApp
//
//  Created by Erkan on 25.02.2023.
//

import UIKit
import SDWebImage

class TopRatedMCollectionViewCell: UICollectionViewCell {

    static let identifier = "TopRatedMCollectionViewCell"
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(topRatedMovies: MovieResult){
        imageView.sd_setImage(with: URL(string: topRatedMovies.posterImage))
    }

}
