//
//  AlbumsTableViewController.swift
//  ItunesTopAlbums
//
//  Created by Fabio Quintanilha on 1/16/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UITableViewController {
    
    var albumsListViewModel : AlbumsListViewModel!
    static let identifier = "AlbumsTableViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.albumsListViewModel = AlbumsListViewModel(delegate: self)
        self.setListView()
    }
    
    private func setListView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .clear
        self.tableView.register(AlbumListCell.self, forCellReuseIdentifier: "AlbumListCell")
        self.tableView.separatorStyle = .singleLine
        self.tableView.separatorInset = .zero
        self.navigationItem.title = "Top 100 Albums"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    deinit {
        print("AlbumsTableViewController deinitiated")
    }
    
}

extension AlbumsTableViewController: AlbumsListDelegate {
    func didUpdateAlbums() {
        self.tableView.reloadData()
    }
}

extension AlbumsTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albumsListViewModel != nil ? self.albumsListViewModel.numOfAlbums : 0
    }
       
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: AlbumListCell.cellIdentifier, for: indexPath) as? AlbumListCell {
            let album =  self.albumsListViewModel.albumAtIndex(indexPath: indexPath)
            cell.setupUI(album: album)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedAlbum =  self.albumsListViewModel.albumAtIndex(indexPath: indexPath)
        let albumViewController = AlbumViewController()
        albumViewController.album = selectedAlbum
        
        navigationController?.pushViewController(albumViewController, animated: false)
    }
       
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 100
       }
}
