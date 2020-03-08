//
//  HomeViewController.swift
//  UalaTechEx
//
//  Created by Federico Flores on 8/3/20.
//  Copyright © 2020 Federico Flores. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var booksTableView: UITableView!
    
    var viewModel: HomeViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        booksTableView.delegate = self
        booksTableView.dataSource = self
        
        navigationController?.title = "Bienvenido a la biblioteca Ualá"
        
        viewModel = HomeViewModel(with: UalaProvider())

        
        guard let vm = viewModel else { return }
        vm.fetchBooks(completion: { (result) in
            print(result)
        }) { (error) in
            print(error)
        }
    }


    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
