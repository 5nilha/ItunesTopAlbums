//
//  AlbumsListViewModel.swift
//  ItunesTopAlbums
//
//  Created by Fabio Quintanilha on 1/16/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

//Blueprint for AlbumsListViewModel
private protocol AlbumsListDataSource: AnyObject {
    var albumsList: [AlbumViewModel] { get set }
    var numOfAlbums: Int { get }
    func albumAtIndex(indexPath: IndexPath) -> AlbumViewModel
    func fetchAlbumAPI()
}

protocol AlbumsListDelegate: AnyObject {
    func didUpdateAlbums()
}

class AlbumsListViewModel: AlbumsListDataSource {
    public fileprivate (set) var albumsList = [AlbumViewModel]()
    weak var delegate: AlbumsListDelegate!
    
    init(delegate: AlbumsListDelegate) {
        self.albumsList.removeAll()
        self.delegate = delegate
        self.fetchAlbumAPI()
    }
    
    deinit {
        print("AlbumsListViewModel deinitiated")
    }
    
    func testAlbumsListViewModel(dataJson: [Any]) {
        self.albumsList.removeAll()
        for data in dataJson  {
            if let jsonData = data as? [String : Any] {
                if let albumVM = AlbumViewModel(dataJson: jsonData) {
                    self.albumsList.append(albumVM)
                }
            }
        }
        if self.delegate != nil {
            self.delegate.didUpdateAlbums()
        }
    }

    var numOfAlbums: Int {
        return self.albumsList.count
    }
    
    func albumAtIndex(indexPath: IndexPath) -> AlbumViewModel {
        let album = albumsList[indexPath.row]
        return album
    }
    
    fileprivate func fetchAlbumAPI() {
        WebServiceHandler(apiURL: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json").get { [weak self] (jsonData) in
            guard let json = jsonData,
            let feed: [String : Any] = json["feed"] as? [String : Any],
            let resultsData: [Any] = feed["results"] as? [Any]
            else { return }
            
            for data in resultsData  {
                if let jsonData = data as? [String : Any] {
                    if let albumVM = AlbumViewModel(dataJson: jsonData) {
                        self?.albumsList.append(albumVM)
                    }
                }
            }
            self?.delegate.didUpdateAlbums()
        }
    }
}

