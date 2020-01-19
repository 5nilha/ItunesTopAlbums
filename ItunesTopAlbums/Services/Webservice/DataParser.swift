//
//  DataParser.swift
//  ItunesTopAlbums
//
//  Created by Fabio Quintanilha on 1/19/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Foundation

/* DataParser Responsability
 * Single responsability of parsing the data to a json formmat
*/
final class DataParser {
    init(){}
    
    deinit {
         print("DataParser deinitiated")
     }
    
    final func parse(data: Data?) -> [String: Any]? {
        guard let data = data else { return nil }
        
        do {
            guard let dataJson = try JSONSerialization.jsonObject(with: data, options: [.mutableLeaves]) as? [String : Any]
            else { return nil }
            return dataJson
        } catch {
            print("JSON error: \(error.localizedDescription)")
            return nil
        }
    }
}
