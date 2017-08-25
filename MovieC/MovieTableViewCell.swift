//
//  MovieTableViewCell.swift
//  MovieC
//
//  Created by Joe Lucero on 8/25/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: JLMovie? {
        didSet {
            DispatchQueue.main.async {
                let title = self.movie?.title ?? "No Title"
                let ratingAsInt = self.movie?.rating as? Int ?? 0
                let ratingAsString = self.howManyStars(numberOfStars: ratingAsInt)
                let overview = self.movie?.overview ?? ""
                
                self.titleLabel.text = title
                self.ratingLabel.text = ratingAsString
                self.overviewLabel.text = overview
                
            }
        }
    }
    
    private func howManyStars(numberOfStars: Int) -> String {
        let starString: String
        
        switch numberOfStars {
        case 1:
            starString = "⭐️"
        case 2:
            starString = "⭐️⭐️"
        case 3:
            starString = "⭐️⭐️⭐️"
        case 4:
            starString = "⭐️⭐️⭐️⭐️"
        case 5:
            starString = "⭐️⭐️⭐️⭐️⭐️"
        case 6:
            starString = "⭐️⭐️⭐️⭐️⭐️⭐️"
        case 7:
            starString = "⭐️⭐️⭐️⭐️⭐️⭐️⭐️"
        case 8:
            starString = "⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️"
        case 9:
            starString = "⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️"
        case 10:
            starString = "⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️⭐️"
        default:
            starString = "Not enough ratings"
        }
        
        return starString
    }

}
