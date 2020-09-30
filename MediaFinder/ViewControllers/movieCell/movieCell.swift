//
//  movieCell.swift
//  MediaFinder
//
//  Created by Abdelrady on 8/26/20.
//  Copyright © 2020 Abdelrady. All rights reserved.
//

import UIKit

class movieCell: UITableViewCell {
    @IBOutlet weak var moviePosterImg: UIImageView!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var movieReleaseyearLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func cellInit(with movie: Movie){
        moviePosterImg.image = UIImage(named: movie.image)
        movieNameLabel.text = movie.movieName
        movieReleaseyearLabel.text = movie.releaseYear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
