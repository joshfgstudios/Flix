//
//  MovieCell.swift
//  MyFavouriteMovies
//
//  Created by Joshua Ide on 6/02/2016.
//  Copyright © 2016 Fox Gallery Studios. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var moviePlot: UILabel!
    @IBOutlet weak var movieIMDBLink: UILabel!
    @IBOutlet weak var movieImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        movieImg.layer.cornerRadius = movieImg.frame.size.width / 2
        movieImg.clipsToBounds = true
    }
    
    func configureCell(movie: Movie) {
        movieTitle.text = movie.title
        moviePlot.text = movie.plot
        movieIMDBLink.text = movie.imdbLink
        movieImg.image = movie.getMovieImage()
    }

}
