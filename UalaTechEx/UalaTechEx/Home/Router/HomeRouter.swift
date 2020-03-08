//
//  HomeRouter.swift
//  UalaTechEx
//
//  Created by Federico Flores on 8/3/20.
//  Copyright © 2020 Federico Flores. All rights reserved.
//

import UIKit

enum HomeRoute: String {
    case Detail
}

protocol HomeRoutable {
    typealias Route = HomeRoute
    
    var viewModel: HomeViewModel? { get }
    init(with viewModel: HomeViewModel)
    
    func navigate(from context: UIViewController, to route: Route, with parameters: Any?)
    
}

class HomeRouter {
    weak var viewModel: HomeViewModel?
    
    required init(with viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    func navigate(from context: UIViewController, to route: HomeRoute, with parameters: Any?) {
        switch route {
        case .Detail:
            let detailViewController = DetailViewController()
            let detailViewModel = BookViewModel()
            detailViewController.detailViewModel = detailViewModel
            detailViewModel.book = parameters as? Book
            context.navigationController?.pushViewController(detailViewController, animated: true)
            
        }
    }
    
}
