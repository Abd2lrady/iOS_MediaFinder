//
//  MovieListVC.swift
//  MediaFinder
//
//  Created by Abdelrady on 8/27/20.
//  Copyright © 2020 Abdelrady. All rights reserved.
//

import UIKit

class movieListVC: UIViewController {
    @IBOutlet weak var movieTable: UITableView!
     var movieList: [Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTable.delegate = self
        movieTable.dataSource = self
        
        let cellNib = UINib(nibName: NibFiles_C.movieCell, bundle: nil)
        movieTable.register(cellNib, forCellReuseIdentifier: TableCellsID_C.movieCell)
        movieData()
        
    }
    
    
    func movieData(){
       
        movieList += [Movie(image: "m1", movieName: "Movie1", releaseYear: "2010")]
        movieList += [Movie(image: "m2", movieName: "Movie2", releaseYear: "2011")]
        movieList += [Movie(image: "m3", movieName: "Movie3", releaseYear: "2012")]
        movieList += [Movie(image: "m4", movieName: "Movie4", releaseYear: "2013")]
        movieList += [Movie(image: "m5", movieName: "Movie5", releaseYear: "2014")]
        movieList += [Movie(image: "m6", movieName: "Movie6", releaseYear: "2015")]
        movieList += [Movie(image: "m7", movieName: "Movie7", releaseYear: "2016")]
        movieList += [Movie(image: "m8", movieName: "Movie8", releaseYear: "2017")]
    }

}


extension movieListVC: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = movieTable.dequeueReusableCell(withIdentifier:TableCellsID_C.movieCell, for: indexPath) as? movieCell else{return UITableViewCell()}
            cell.cellInit(with: movieList[indexPath.row])
        
        return cell
        
    }
    
    
}

extension movieListVC:  UITableViewDelegate  {
    
}
