//
//  DetailViewController.swift
//  UalaTechEx
//
//  Created by Federico Flores on 8/3/20.
//  Copyright © 2020 Federico Flores. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet weak var bookImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var availabilityLabel: UILabel!
    
    @IBOutlet weak var popularityLabel: UILabel!
    
    
    var detailViewModel: BookViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detalles del libro"
        setup()
    }
    
    func setup(){
        let url = URL(string:detailViewModel?.image() ?? "")
        bookImageView.kf.setImage(with: url, placeholder: UIImage(named: "notAvailable"))
        titleLabel.text = detailViewModel?.name()
        authorLabel.text = detailViewModel?.author()
        availabilityLabel.text = detailViewModel?.availability()
        popularityLabel.text = detailViewModel?.popularity()
    }


    
}
