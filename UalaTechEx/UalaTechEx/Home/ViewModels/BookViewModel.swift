//
//  BookViewModel.swift
//  UalaTechEx
//
//  Created by Federico Flores on 8/3/20.
//  Copyright © 2020 Federico Flores. All rights reserved.
//

import Foundation

class BookViewModel {
    var book: Book?
    
    func name() -> String {
        return book?.name ?? "Título no disponible"
    }
    
    func author() -> String {
        return book?.author ?? "Author no disponible"
    }
    
    func popularity() -> String {
        guard let book = book else { return "Popularidad no disponible"}
        return "Popularidad: " + String(book.popularity) + "/100"
    }
    
    func availability() -> String {
        guard let book = book else { return "Disponibilidad no disponible"}
        if book.available  {
            return "Disponible"
        } else {
            return "No dispoible"
        }
    }
    
    func image() -> String {
        return book?.image ?? ""
    }
    
    
}
