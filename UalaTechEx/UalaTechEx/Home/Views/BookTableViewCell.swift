//
//  BookTableViewCell.swift
//  UalaTechEx
//
//  Created by Federico Flores on 8/3/20.
//  Copyright © 2020 Federico Flores. All rights reserved.
//

import UIKit
import Kingfisher


class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var availabilityLabel: UILabel!
    
    @IBOutlet weak var popularityLabel: UILabel!
    
    @IBOutlet weak var bookImageView: UIImageView!
    
    func setup(with viewModel: BookViewModel){
        nameLabel.text = viewModel.name()
        authorLabel.text = viewModel.author()
        availabilityLabel.text = viewModel.availability()
        popularityLabel.text = viewModel.popularity()
        let url = URL(string: viewModel.image())
        bookImageView.kf.setImage(with: url, placeholder: UIImage(named: "notAvailable"))
    }
    
    
}
