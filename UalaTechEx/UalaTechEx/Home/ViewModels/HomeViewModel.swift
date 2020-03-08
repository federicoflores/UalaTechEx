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
    var books = [Book]()
    
    init(with provider: UalaProvider) {
        self.ualaProvider = provider
    }
    
    private func fetchBooks(completion: @escaping ([Book])-> Void, fail: @escaping (String)->Void) {
        ualaProvider.retrieveBook(completion: completion, fail: fail)
    }
    
    func getBooksAndUpdateView(updateView: @escaping ()->()){
        fetchBooks(completion: { (books) in
            self.books = self.sortByPopularity(books: books)
            updateView()
        }, fail: { (fail) in
            print(fail)
            updateView()
        })
    }
    
    func sortByPopularity(books: [Book]) -> [Book]{
        var sortedBooks: [Book] = []
        sortedBooks = books.sorted { (book1, book2) -> Bool in
            book1.popularity > book2.popularity
        }
        return sortedBooks
    }
    
    
    
}
