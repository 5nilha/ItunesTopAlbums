//
//  AlbumsListViewModel.swift
//  ItunesTopAlbums
//
//  Created by Fabio Quintanilha on 1/16/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

protocol AlbumsListDelegate: AnyObject {
    func didUpdateAlbums()
}

class AlbumsListViewModel {
    
    private var albumsList = [AlbumViewModel]()
    weak var delegate: AlbumsListDelegate!
    
    init(delegate: AlbumsListDelegate) {
        self.albumsList.removeAll()
        self.delegate = delegate
        
        WebService.shared.fetch { [weak self] (resultData) in
            for data in resultData  {
                if let jsonData = data as? [String : Any] {
                    if let albumVM = AlbumViewModel(dataJson: jsonData) {
                        self?.albumsList.append(albumVM)
                    }
                }
            }
            delegate.didUpdateAlbums()
        }
    }

    var numOfAlbums: Int {
        return self.albumsList.count
    }
    
    func albumAtIndex(indexPath: IndexPath) -> AlbumViewModel {
        let album = albumsList[indexPath.row]
        return album
    }
    
}

