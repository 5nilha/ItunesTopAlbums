//
//  ImageService.swift
//  ItunesTopAlbums
//
//  Created by Fabio Quintanilha on 1/19/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Foundation
import UIKit

class ImageService {
    
    static let cache = NSCache<NSString, UIImage>()
    
    static func getImage(withStringURL url: String, completion: @escaping (_ image: UIImage?) -> ()) {
        guard let imageURL = URL(string: url) else { return }
        
        //Checks if image exists in the cache
        if let image = cache.object(forKey: NSString(string: url)) {
            completion(image)
        }
        else {
            DispatchQueue.global().async {
                do {
                    let data = try Data(contentsOf: imageURL)
                    if let downloadedImage = UIImage(data: data) {
                        
                        //Caching Image
                        cache.setObject(downloadedImage, forKey: NSString(string: url))
                        
                        DispatchQueue.main.async {
                            completion(downloadedImage)
                        }
                    } else {
                        completion(nil)
                        return
                    }
                } catch {
                    completion(nil)
                    return
                }
            }
        }
    }
}
