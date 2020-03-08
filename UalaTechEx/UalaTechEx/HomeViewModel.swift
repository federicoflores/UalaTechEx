//
//  HomeViewModel.swift
//  UalaTechEx
//
//  Created by Federico Flores on 8/3/20.
//  Copyright © 2020 Federico Flores. All rights reserved.
//

import Foundation

class HomeViewModel {
    var ualaProvider: UalaProvider
    
    init(with provider: UalaProvider) {
        self.ualaProvider = provider
    }
    
     func fetchBooks(completion: @escaping ([Book])-> Void, fail: @escaping (String)->Void) {
        ualaProvider.retrieveBook(completion: completion, fail: fail)
    }
}
