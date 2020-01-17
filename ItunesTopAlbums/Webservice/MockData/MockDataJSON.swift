//
//  MockDataJSON.swift
//  ItunesTopAlbumsTests
//
//  Created by Fabio Quintanilha on 1/16/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import Foundation
//@testable import ItunesTopAlbums

struct MockDataJson {
    static var data : [[String : Any]] {
        let jsonData = [[
            "artistName": "Roddy Ricch",
            "id": "1490463311",
            "releaseDate": "2019-12-06",
            "name": "Please Excuse Me For Being Antisocial",
            "kind": "album",
            "copyright": "℗ 2019 Atlantic Recording Corporation for the United States and WEA International Inc. for the world outside of the United States. A Warner Music Group Company",
            "artistId": "1212442072",
            "contentAdvisoryRating": "Explicit",
            "artistUrl": "https://music.apple.com/us/artist/roddy-ricch/1212442072?app=music",
            "artworkUrl100": "https://is4-ssl.mzstatic.com/image/thumb/Music113/v4/ec/4b/79/ec4b7992-978e-7ece-208b-c098b7ef4023/075679829085.jpg/200x200bb.png",
            "genres": [
                [
                    "genreId": "18",
                    "name": "Hip-Hop/Rap",
                    "url": "https://itunes.apple.com/us/genre/id18"
                ],
                [
                    "genreId": "34",
                    "name": "Music",
                    "url": "https://itunes.apple.com/us/genre/id34"
                ]
            ],
            "url": "https://music.apple.com/us/album/please-excuse-me-for-being-antisocial/1490463311?app=music"
        ],
        [
            "artistName": "Moneybagg Yo",
            "id": "1494066621",
            "releaseDate": "2020-01-10",
            "name": "Time Served",
            "kind": "album",
            "copyright": "℗ 2020 N-Less Entertainment/Interscope Records",
            "artistId": "991187319",
            "contentAdvisoryRating": "Explicit",
            "artistUrl": "https://music.apple.com/us/artist/moneybagg-yo/991187319?app=music",
            "artworkUrl100": "https://is5-ssl.mzstatic.com/image/thumb/Music113/v4/1b/6e/70/1b6e7060-b568-15dd-3037-abf77777d510/20UMGIM00345.rgb.jpg/200x200bb.png",
            "genres": [
                [
                    "genreId": "18",
                    "name": "Hip-Hop/Rap",
                    "url": "https://itunes.apple.com/us/genre/id18"
                ],
                [
                    "genreId": "34",
                    "name": "Music",
                    "url": "https://itunes.apple.com/us/genre/id34"
                ]
            ],
            "url": "https://music.apple.com/us/album/time-served/1494066621?app=music"
        ],
        [
            "artistName": "JACKBOYS & Travis Scott",
            "id": "1492785997",
            "releaseDate": "2019-12-27",
            "name": "JACKBOYS",
            "kind": "album",
            "copyright": "℗ 2019 Epic Records. With Cactus Jack.",
            "artistId": "1492785998",
            "contentAdvisoryRating": "Explicit",
            "artistUrl": "https://music.apple.com/WebObjects/MZStore.woa/wa/viewCollaboration?cc=us&ids=1492785998-549236696&app=music",
            "artworkUrl100": "https://is3-ssl.mzstatic.com/image/thumb/Music113/v4/49/c4/9b/49c49b79-d271-57b3-5c77-7b91e65e7b3b/886448209393.jpg/200x200bb.png",
            "genres": [
                [
                    "genreId": "18",
                    "name": "Hip-Hop/Rap",
                    "url": "https://itunes.apple.com/us/genre/id18"
                ],
                [
                    "genreId": "34",
                    "name": "Music",
                    "url": "https://itunes.apple.com/us/genre/id34"
                ]
            ],
            "url": "https://music.apple.com/us/album/jackboys/1492785997?app=music"
        ]]
        
        return jsonData
    }
}
