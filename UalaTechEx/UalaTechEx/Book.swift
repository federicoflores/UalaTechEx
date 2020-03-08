//
//  Book.swift
//  UalaTechEx
//
//  Created by Federico Flores on 8/3/20.
//  Copyright © 2020 Federico Flores. All rights reserved.
//

import Foundation

class Book: Decodable {
    var id: Int
    var name: String
    var author: String
    var available: Bool
    var popularity: Int
    var image: String
    
    enum CodingKeys:  String, CodingKey {
        case id
        case name = "nombre"
        case author = "autor"
        case available = "disponibilidad"
        case popularity = "popularidad"
        case image = "imagen"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        author = try container.decode(String.self, forKey: .author)
        available = try container.decode(Bool.self, forKey: .available)
        popularity = try container.decode(Int.self, forKey: .popularity)
        image = try container.decode(String.self, forKey: .image)
    }
    
}
