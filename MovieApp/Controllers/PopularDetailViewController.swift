//
//  PopularDetailViewController.swift
//  MovieApp
//
//  Created by Erkan on 25.02.2023.
//

import UIKit

class PopularDetailViewController: UIViewController {
    
    
    var Movies : MovieResult!
    let blurEffect = UIBlurEffect(style: .light)
    let blurEffectView = UIVisualEffectView()
    
    @IBOutlet weak var yildizLabel: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView2: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView1.layer.cornerRadius = 15
        
       // let image: UIImage = yourImageView.image
        configure()
        


        
    }
    

    
    
    
    private func configure(){
        yildizLabel.text = String(format: "%.1f", Movies.voteAverage!)
        imageView1.sd_setImage(with: URL(string: Movies.posterImage))
        imageView2.sd_setImage(with: URL(string: Movies.posterImageımsı))
        descriptionLabel.text = Movies.overview
        titleLabel.text = Movies.title
        print("BackdropPath: \(Movies.backdropPath)")
        print("genreIDS: \(Movies.genreIDS)")
    }
    

    

}
