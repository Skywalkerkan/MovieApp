//
//  MoviesViewController.swift
//  MovieApp
//
//  Created by Erkan on 24.02.2023.
//

import UIKit

class MoviesViewController: UIViewController {

    
   
    @IBOutlet weak var trendCollectionViews: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var topRatedCollectionView: UICollectionView!
    
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var popularMovies : [MovieResult] = []
    var topRatedMovies: [MovieResult] = []
    var upcomingMovies: [MovieResult] = []
    var trendMoviesSlide: [MovieResult] = []
    
    var currentSlide = 0{
        didSet{
            pageControl.currentPage = currentSlide
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trendCollectionViews.dataSource = self
        trendCollectionViews.delegate = self
        
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        topRatedCollectionView.delegate = self
        topRatedCollectionView.dataSource = self
        upcomingCollectionView.delegate = self
        upcomingCollectionView.dataSource = self
        
        registerCell()
        
        
        HomeManager.shared.getTrendingMovies { [weak self] movie, error in
            if let error = error{
                print(error.localizedDescription)
            }else{
                self?.trendMoviesSlide = movie?.results ?? []
                self?.pageControl.numberOfPages = self?.trendMoviesSlide.count ?? 0
                self?.trendCollectionViews.reloadData()
                //print("aaaaaaaaaaaaaaaaaaaaaaasdsadsadsa \(self?.trendMoviesSlide[1].title)")
            }
        }
        
        HomeManager.shared.getCategoryMovies { [weak self] movie, error in
            if let error = error{
                print(error.localizedDescription)
            }else{
                //print("kekekeke")
                self?.popularMovies = movie?.results ?? []
                //print("aaaaaaaaaaa\(movie)")
                
                self?.popularCollectionView.reloadData()
            }
        }
        
        HomeManager.shared.getTopRatedMovies { [weak self] movie, error in
            if let error = error{
                print(error.localizedDescription)
            }
            else{
                self?.topRatedMovies = movie?.results ?? []
                self?.topRatedCollectionView.reloadData()
            }
        }
        
        HomeManager.shared.getUpcomingMovies { [weak self] movie, error in
            if let error = error{
                print(error.localizedDescription)
            }else{
                self?.upcomingMovies = movie?.results ?? []
                self?.upcomingCollectionView.reloadData()
            }
        }
        
        
        
        
        
    }
    
 
    
    func registerCell(){
        
        trendCollectionViews.register(UINib(nibName: SlidingCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SlidingCollectionViewCell.identifier)
        
        popularCollectionView.register(UINib(nibName: PopularMCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularMCollectionViewCell.identifier)
        
        topRatedCollectionView.register(UINib(nibName: TopRatedMCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: TopRatedMCollectionViewCell.identifier)
        
        upcomingCollectionView.register(UINib(nibName: UpcomingMCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: UpcomingMCollectionViewCell.identifer)
        
    }
 

    
}


extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
            
        case trendCollectionViews:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlidingCollectionViewCell.identifier, for: indexPath) as! SlidingCollectionViewCell
            cell.configure(trendMovie: trendMoviesSlide[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularMCollectionViewCell.identifier, for: indexPath) as! PopularMCollectionViewCell
            cell.configure(popularMovies: popularMovies[indexPath.row])
            return cell
        case topRatedCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopRatedMCollectionViewCell.identifier, for: indexPath) as! TopRatedMCollectionViewCell
            cell.configure(topRatedMovies: topRatedMovies[indexPath.row])
            return cell
        case upcomingCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingMCollectionViewCell.identifer, for: indexPath) as! UpcomingMCollectionViewCell
            cell.configure(upcomingMovie: upcomingMovies[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
        
        
        
        /*let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularMCollectionViewCell.identifier, for: indexPath) as! PopularMCollectionViewCell
         //print("aaaaaa")
         //print(popularMovies[indexPath.row])
         // print(popularMovies[indexPath.row].title)
         cell.configure(popularMovies: popularMovies[indexPath.row])
         // print(cell)
         return cell*/
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView{
        case trendCollectionViews:
            return trendMoviesSlide.count
        case popularCollectionView:
            return popularMovies.count
        case topRatedCollectionView:
            return topRatedMovies.count
        case upcomingCollectionView:
            return upcomingMovies.count
        default: return 0
        }
        
        
        /*print(popularMovies.count)
         return self.popularMovies.count*/
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = PopularDetailViewController.instantiate()
        if collectionView == popularCollectionView{
            controller.Movies = popularMovies[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
        else if collectionView == topRatedCollectionView{
            controller.Movies = topRatedMovies[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
        else if collectionView == upcomingCollectionView{
            controller.Movies = upcomingMovies[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
        else if collectionView == trendCollectionViews{
            controller.Movies = trendMoviesSlide[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        switch scrollView{
        case trendCollectionViews:
            let width = scrollView.frame.width
            currentSlide = Int(scrollView.contentOffset.x/width)
        default:
            return
        }
    }
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView{
        case trendCollectionViews:
            let size = collectionView.frame.size
            return CGSize(width: size.width, height: size.height)
        case popularCollectionView:
            let size = collectionView.frame.size
            return CGSize(width: size.width, height: size.height)
        case upcomingCollectionView:
            let size = collectionView.frame.size
            return CGSize(width: size.width, height: size.height)
        case topRatedCollectionView:
            let size = collectionView.frame.size
            return CGSize(width: size.width, height: size.height)
        default:
            return CGSize()
        }
    }
    
    
    
    
}
    
    



