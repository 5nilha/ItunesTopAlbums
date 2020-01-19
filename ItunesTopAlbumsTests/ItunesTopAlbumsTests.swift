//
//  ItunesTopAlbumsTests.swift
//  ItunesTopAlbumsTests
//
//  Created by Fabio Quintanilha on 1/16/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import XCTest

@testable import ItunesTopAlbums

class ItunesTopAlbumsTests: XCTestCase {
    
    var albumsTableVC: AlbumsTableViewController!

    override func setUp() {
        albumsTableVC = AlbumsTableViewController()
        _ = albumsTableVC.view
        albumsTableVC.albumsListViewModel.testAlbumsListViewModel(dataJson: MockDataJson.data)
        
    }

    override func tearDown() {
        albumsTableVC = nil
    }

    func testAlbumTableVC() {
        XCTAssertEqual(albumsTableVC.tableView.numberOfRows(inSection: 0), MockDataJson.data.count)
        
//        let cell: AlbumListCell!
//        let tableView: UITableView = albumsTableVC.tableView
//
//        for index in 0..<albumsTableVC.albumsListViewModel.numOfAlbums {
////            cell = albumsTableVC.UI
////            let album = albumsTableVC.albumsListViewModel.albumAtIndex(indexPath: )
//        }
    }
    
    func testDetailVC() {
        let albumsVC = AlbumViewController()
        
        for album in albumsTableVC.albumsListViewModel.albumsList {
            albumsVC.album = album
            _ = albumsVC.view
            assert(albumsVC.albumNameLabel.text != nil)
            assert(albumsVC.artistNameLabel.text != nil)
            assert(albumsVC.copyrightLabel.text != nil)
            assert(albumsVC.releasedAt.text != nil)
            assert(albumsVC.genreLabel.text != nil)
        }
    }
    
    func testAPIResquest() {
        WebServiceHandler(apiURL: "https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/100/explicit.json").get { (jsonData) in
            guard let json = jsonData,
            let feed: [String : Any] = json["feed"] as? [String : Any],
            let resultsData: [Any] = feed["results"] as? [Any]
            else { return }
            
            let count = resultsData.count
            assert(resultsData.count > 0, "Returning \(count) Albums")
        }
    }
}
