//
//  APIHandler.swift
//  ItunesTopAlbums
//
//  Created by Fabio Quintanilha on 1/19/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Foundation

/* API Handler Responsability
 * Single responsability of fetching an API Data
*/
final class APIHandler {
    private var url: String!
    
    init(url: String) {
        self.url = url
    }
    
    deinit {
         print("APIHandler deinitiated")
     }
    
    final func fetchAPIData(httpMethod: HttpMethod, body: Data?, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                completion(data, response, error)
            }.resume()
        }
    }
}
