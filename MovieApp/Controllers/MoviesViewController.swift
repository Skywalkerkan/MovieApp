//
//  MoviesViewController.swift
//  MovieApp
//
//  Created by Erkan on 24.02.2023.
//

import UIKit

class MoviesViewController: UIViewController {

    
   
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var topRatedCollectionView: UICollectionView!
    
    @IBOutlet weak var upcomingCollectionView: UICollectionView!
    
    
    var popularMovies : [MovieResult] = []
    var topRatedMovies: [MovieResult] = []
    var upcomingMovies: [MovieResult] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        topRatedCollectionView.delegate = self
        topRatedCollectionView.dataSource = self
        upcomingCollectionView.delegate = self
        upcomingCollectionView.dataSource = self
        
        registerCell()
        
        HomeManager.shared.getCategoryMovies { [weak self] movie, error in
            if let error = error{
                print(error.localizedDescription)
            }else{
                //print("kekekeke")
                self?.popularMovies = movie?.results ?? []
                print("aaaaaaaaaaa\(movie)")
                
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
        
        popularCollectionView.register(UINib(nibName: PopularMCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: PopularMCollectionViewCell.identifier)
        
        topRatedCollectionView.register(UINib(nibName: TopRatedMCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: TopRatedMCollectionViewCell.identifier)
        
        upcomingCollectionView.register(UINib(nibName: UpcomingMCollectionViewCell.identifer, bundle: nil), forCellWithReuseIdentifier: UpcomingMCollectionViewCell.identifer)
        
    }
 

    
}


extension MoviesViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView{
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
    }
    
    
}


