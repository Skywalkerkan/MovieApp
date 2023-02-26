//
//  SearchViewController.swift
//  MovieApp
//
//  Created by Erkan on 26.02.2023.
//

import UIKit

class SearchViewController: UIViewController {

    //let data = ["Erkan", "Mehmet", "Nagehan", "Furuki", "Kel Naci"]
    var data : [MovieResult] = []
    var filteredData: [MovieResult] = []
    var filters: [MovieResult] = []
    var trimmed : String = ""
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.autocapitalizationType = .words
        tableView.isHidden = false
        registerCell()
        filteredData = data
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
 
    }
    
    
    func registerCell(){
        tableView.register(UINib(nibName: SearchTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SearchTableViewCell.identifier)
    }
    


    
    func searchApi(movieName: String){
        HomeManager.shared.getSearchingMovies(queryParameter: "&query=\(movieName)") { movie, error in
            if let error = error{
                print("Errorcuk \(error.localizedDescription)")
            }
            else{
                self.data = movie?.results ?? []
            }
        }
    }
    
    

}




extension SearchViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
       /* if searchText.last == " "{
            print("melek")
            var kelime = ""
            
            kelime = searchText.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
            print(kelime)
            searchApi(movieName: kelime)
        }*/
        

        
        
        
        
        if searchText.contains(" "){
         var kelime = ""
         
         kelime = searchText.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
         print(kelime)
         searchApi(movieName: kelime)
        }
        
        searchApi(movieName: searchText)
        print(searchText)
        filteredData = []
        tableView.isHidden = false
        /*for movie in self.data{
        tableView.isHidden = false
            if ((movie.originalTitle?.lowercased().contains(searchText.lowercased())) != nil){
                filteredData = data
            }
        }*/
        
        for movie in self.data{
        tableView.isHidden = false
            if ((movie.originalTitle?.lowercased().contains(searchText.lowercased())) != nil){
                filteredData = data
                
                /*for filter in filteredData{
                    if filter.originalTitle == searchText.lowercased(){
                        filters = filteredData
                    }
                }*/
            }
        }

            //print(filters)
            self.tableView.reloadData()
        
        
        if searchText == ""{
            tableView.isHidden = true
        }
        
       /* if searchText == ""{
            filteredData = data
        }
        
        for word in data{
            if word.uppercased().contains(searchText.uppercased()){
                filteredData.append(word)
            }
        }
        self.tableView.reloadData()
        */
        
    }
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier) as! SearchTableViewCell
        cell.cellConfigure(movies: filteredData[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = PopularDetailViewController.instantiate()
        controller.Movies = filteredData[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
