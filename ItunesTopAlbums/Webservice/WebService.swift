//
//  WebService.swift
//  ItunesTopAlbums
//
//  Created by Fabio Quintanilha on 1/16/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Foundation
enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}


class WebService {
    private init(){}
    static let shared = WebService()
    
    func fetch(completion: @escaping ([Any]) -> Void) {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.get.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        DispatchQueue.global().async {
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    return
                }
                guard let data = data else { return }
                
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any],
                        let feed: [String : Any] = json["feed"] as? [String : Any],
                        let results: [Any] = feed["results"] as? [Any]
                    else { return }
                    
                    DispatchQueue.main.async {
                        completion(results)
                    }
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                    return
                }
            }.resume()
        }
    }
}
