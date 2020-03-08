//
//  UalaProvider.swift
//  UalaTechEx
//
//  Created by Federico Flores on 8/3/20.
//  Copyright © 2020 Federico Flores. All rights reserved.
//

import Foundation
import Alamofire

class UalaProvider {
    
    private var baseUrl = "https://qodyhvpf8b.execute-api.us-east-1.amazonaws.com/test/books"
    
    func retrieveBook<T: Decodable>(completion: @escaping (T)->(), fail: @escaping (String)->()) {
        Alamofire.request(baseUrl, method: .get, parameters: nil, encoding: URLEncoding.default).responseJSON { (response) in
            switch response.result {
            case .success(_):
                guard let json = response.data else { return }
                let decoder = JSONDecoder()
                if let model = try? decoder.decode(T.self, from: json) {
                    completion(model)
                }
            case .failure(let error):
                fail(error.localizedDescription)
            }
        }
    }
    
    
}

