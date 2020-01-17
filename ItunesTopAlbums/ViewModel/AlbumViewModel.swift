//
//  AlbumViewModel.swift
//  ItunesTopAlbums
//
//  Created by Fabio Quintanilha on 1/16/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

struct AlbumViewModel {
    
    private var album: Album!
    
    init?(dataJson: [String : Any]) {
        guard let album = Album(dataJson: dataJson) else { return nil }
        self.album = album
    }
    
    var name: String {
        return self.album.name
    }
    
    var artistName: String {
        return self.album.artistName
    }
    
    var thumbnailImageURL: String {
        return self.album.thumbnailImageURL
    }
    
    var genres: String {
        var albumGenres = ""
        for index in 0..<self.album.genres.count {
            if index == 0 {
                albumGenres = self.album.genres[index]
            } else {
                albumGenres += ", \(self.album.genres[index])"
            }
        }
        return albumGenres
    }
    
    var releaseDate: String {
        return self.album.releaseDate.formattedDateString
    }
    
    var copyrightInfo: String {
        return self.album.copyrightInfo
    }
    
    var albumUrl: String {
        return self.album.albumUrl
    }
    
    func loadAlbumImage(completion: @escaping (UIImage) -> ())  {
        if let imageURL = URL(string: self.album.thumbnailImageURL) {
            print(imageURL)
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageURL) {
                    print(data)
                    if let image = UIImage(data: data) {
                        completion(image)
                    }
                }
            }
        }
    }
    
}
