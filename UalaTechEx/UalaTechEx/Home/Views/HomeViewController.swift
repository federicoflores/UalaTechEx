//
//  HomeViewController.swift
//  UalaTechEx
//
//  Created by Federico Flores on 8/3/20.
//  Copyright © 2020 Federico Flores. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var booksTableView: UITableView!
    
    @IBOutlet weak var errorLabel: UILabel!
    var viewModel: HomeViewModel?
    var spiner: SpinnerView?
    var router: HomeRouter?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bienvenido a la biblioteca Ualá"
        
        let button1 = UIBarButtonItem(image: UIImage(named: "upDown2"), style: .done, target: self, action: #selector(sortByPopularityTapped))
        
        self.navigationItem.rightBarButtonItem  = button1

        setSpinner()
        registerTableView()
        
        viewModel = HomeViewModel(with: UalaProvider())
        
        guard let vm = viewModel else { return }
        router = HomeRouter(with: vm)
        vm.getBooksAndUpdateView(updateView: {
            self.spiner?.stop()
            self.booksTableView.isHidden = false
            self.booksTableView.reloadData()
        }, updateFailView: {
            self.spiner?.stop()
            self.booksTableView.isHidden = true
            self.errorLabel.isHidden = false
        }
        )
    }
    
    @objc private func sortByPopularityTapped(){
        guard let vm = viewModel else { return }
        vm.books = vm.sortByPopularity(books: vm.books)
        booksTableView.reloadData()
        
    }
    
    private func setSpinner(){
        let centerY = UIScreen.main.bounds.height * 0.5 - 25.0
        let centerX = UIScreen.main.bounds.width * 0.5 - 25.0
        spiner = SpinnerView(frame: CGRect(x: centerX, y: centerY, width: 50, height: 50))
        
        guard let spiner = spiner else { return }
        self.view.addSubview(spiner)
        booksTableView.isHidden = true
        spiner.animate()
        
    }
    
    private func registerTableView(){
        booksTableView.delegate = self
        booksTableView.dataSource = self
        let xib = UINib(nibName: "BookTableViewCell", bundle: nil)
        booksTableView.register(xib, forCellReuseIdentifier: "UalaBook")
        booksTableView.rowHeight = UITableView.automaticDimension
        
    }
    
    @IBAction func availableButtonTapped(_ sender: Any) {
        viewModel?.isAvailable()
        self.booksTableView.reloadData()
    }
    
    @IBAction func notAvailableButtonTapped(_ sender: Any) {
        viewModel?.isNotAvailable()
        self.booksTableView.reloadData()
    }
    
    @IBAction func everyAvailabilityButtonTapped(_ sender: Any) {
        viewModel?.bothAvailability()
        self.booksTableView.reloadData()
    }
    

    
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let vm = viewModel else { return 0 }
        return vm.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UalaBook") as? BookTableViewCell, let vm = viewModel else { return UITableViewCell() }
        let book = vm.books[indexPath.row]
        let bookViewModel = BookViewModel()
        bookViewModel.book = book
        cell.setup(with: bookViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vm = viewModel else { return }
        let book = vm.books[indexPath.row]
        router?.navigate(from: self, to: .Detail, with: book)
    }
    
    
}
