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

final class WebServiceHandler {
    private var apiHandler: APIHandler!
    private var dataParser: DataParser!
    
    init(apiURL: String) {
        self.apiHandler = APIHandler(url: apiURL)
        self.dataParser = DataParser()
    }
    
    deinit {
        print("WebServiceHandler deinitiated")
    }
    
    func get(completion: @escaping ([String : Any]?) -> Void) {
        apiHandler.fetchAPIData(httpMethod: .get, body: nil) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            let json = self.dataParser.parse(data: data)
            self.dataParser = nil
            
            DispatchQueue.main.async {
                completion(json)
                self.apiHandler = nil
            }
        }
    }
    
    func post(body: Data, completion: @escaping ([String : Any]?, URLResponse?) -> () ) {
        apiHandler.fetchAPIData(httpMethod: .post, body: nil) { (data, response, error) in
            guard let data = data else {
                completion(nil, response)
                return
            }
            let json = self.dataParser.parse(data: data)
            DispatchQueue.main.async {
                completion(json, response)
            }
        }
    }
}
