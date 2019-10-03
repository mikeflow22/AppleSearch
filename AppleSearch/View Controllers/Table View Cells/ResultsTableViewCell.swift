//
//  ResultsTableViewCell.swift
//  AppleSearch
//
//  Created by Michael Flowers on 10/3/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {
  
    var musicItem: MusicSearchResult? {
        didSet {
            guard let item = musicItem else { return }
            titleLabel.text = item.trackName
            descriptionLabel.text = item.artistName
            myImageView.image = nil //doesn't reuse an image if there is no image for scrolling purposes.
            
            SearchResultController.getMusicImageFor(itemFromModel: item) { (image) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    self.myImageView.image = image
                }
            }
        }
    }
    
    
    var appItem: AppSearchResult? {
        didSet {
            guard let item = appItem else { return }
            titleLabel.text = item.trackName
            descriptionLabel.text = item.description
            myImageView.image = nil //doesn't reuse an image if there is no image for scrolling purposes.
          
             SearchResultController.getAppImageFor(itemFromModel: item) { (image) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    self.myImageView.image = image
                }
            }
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    

}
