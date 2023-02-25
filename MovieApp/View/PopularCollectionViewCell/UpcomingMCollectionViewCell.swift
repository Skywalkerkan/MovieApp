//
//  UpcomingMCollectionViewCell.swift
//  MovieApp
//
//  Created by Erkan on 25.02.2023.
//

import UIKit

class UpcomingMCollectionViewCell: UICollectionViewCell {

    
    static let identifer = "UpcomingMCollectionViewCell"
    
    @IBOutlet weak var upcomingLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    
    func configure(upcomingMovie: MovieResult){
        imageView.sd_setImage(with: URL(string: upcomingMovie.posterImage))
        upcomingLabel.text = upcomingMovie.releaseDate
    }

}
