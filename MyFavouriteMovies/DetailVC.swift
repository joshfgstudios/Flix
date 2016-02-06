//
//  DetailVC.swift
//  MyFavouriteMovies
//
//  Created by Joshua Ide on 6/02/2016.
//  Copyright © 2016 Fox Gallery Studios. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    //Properties
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblLink: UILabel!
    @IBOutlet weak var lblPlot: UILabel!
    
    //Variables
    var movie: Movie?
    
    //Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitle.text = movie?.title
        lblPlot.text = movie?.plot
        lblLink.text = movie?.imdbLink
        imgMovie.image = movie?.getMovieImage()
        
        imgMovie.layer.cornerRadius = imgMovie.frame.size.width / 24
        imgMovie.clipsToBounds = true
    }
    
    //Actions
    @IBAction func onBackPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
