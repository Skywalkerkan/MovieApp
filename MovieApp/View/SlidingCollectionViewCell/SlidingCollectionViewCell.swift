//
//  SlidingCollectionViewCell.swift
//  MovieApp
//
//  Created by Erkan on 26.02.2023.
//

import UIKit
import SDWebImage

class SlidingCollectionViewCell: UICollectionViewCell {

    static let identifier = "SlidingCollectionViewCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    
    func configure(trendMovie: MovieResult){
        imageView.sd_setImage(with: URL(string: trendMovie.posterImageımsı))
        
        
    }

}
