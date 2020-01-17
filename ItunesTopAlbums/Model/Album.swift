//
//  Album.swift
//  ItunesTopAlbums
//
//  Created by Fabio Quintanilha on 1/16/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Foundation

struct Album {
    public private (set) var name: String!
    public private (set) var artistName: String!
    public private (set) var thumbnailImageURL: String!
    public private (set) var genres = [String]()
    public private (set) var releaseDate: Date!
    public private (set) var copyrightInfo: String!
    public private (set) var albumUrl: String!
    
    init?(dataJson: [String: Any]) {
        guard let name = dataJson["name"] as? String,
        let artistName = dataJson["artistName"] as? String,
        let thumbnailImageURL = dataJson["artworkUrl100"] as? String,
        let genres = dataJson["genres"] as? [[String : Any]],
        let releaseDate = dataJson["releaseDate"] as? String,
        let copyrightInfo = dataJson["copyright"] as? String,
        let albumUrl = dataJson["url"] as? String
            else {
                return nil
        }
        
        self.name = name
        self.artistName = artistName
        self.thumbnailImageURL = thumbnailImageURL
        self.copyrightInfo = copyrightInfo
        self.albumUrl = albumUrl
        self.releaseDate = self.convertDate(dateString: releaseDate)
        for genre in genres {
            if let albumGenre = genre["name"] as? String {
                self.genres.append(albumGenre)
            }
        }
    }
    
    func convertDate(dateString: String) -> Date? {
        let isoDate = dateString

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from:isoDate)
        return date
    }
}
