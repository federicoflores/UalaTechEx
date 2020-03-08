//
//  HomeViewModel.swift
//  UalaTechEx
//
//  Created by Federico Flores on 8/3/20.
//  Copyright © 2020 Federico Flores. All rights reserved.
//

import Foundation

class HomeViewModel {
    private var ualaProvider: UalaProvider
    var books = [Book]()
    var auxAllBooks = [Book]()
    private var isSortedAscending = false
    
    
    init(with provider: UalaProvider) {
        self.ualaProvider = provider
    }
    
    private func fetchBooks(completion: @escaping ([Book])-> Void, fail: @escaping (String)->Void) {
        ualaProvider.retrieveBook(completion: completion, fail: fail)
    }
    
    func getBooksAndUpdateView(updateView: @escaping ()->(), updateFailView: @escaping ()->()){
        fetchBooks(completion: { (books) in
            self.auxAllBooks = books
            self.books = self.auxAllBooks
            self.books = self.sortByPopularity(books: books)
            self.isSortedAscending = true
            updateView()
        }, fail: { (fail) in
            print(fail)
            updateFailView()
        })
    }
    
    func sortByPopularity(books: [Book]) -> [Book]{
        if isSortedAscending {
        var sortedBooks: [Book] = []
        sortedBooks = books.sorted { (book1, book2) -> Bool in
            book1.popularity < book2.popularity
        }
            isSortedAscending = false
        return sortedBooks
        } else {
            var sortedBooks: [Book] = []
            sortedBooks = books.sorted { (book1, book2) -> Bool in
                book1.popularity > book2.popularity
            }
            isSortedAscending = true
            return sortedBooks
        }
    }
    
    func isAvailable(){
        books = auxAllBooks
        books = books.filter { (book) -> Bool in
            book.available
        }
    }
        
    func isNotAvailable(){
        books = auxAllBooks
        books = books.filter { (book) -> Bool in
            !book.available
            }
        }
        
        func bothAvailability(){
            books = auxAllBooks
        }
    
}
