//
//  AlbumViewController.swift
//  ItunesTopAlbums
//
//  Created by Fabio Quintanilha on 1/16/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {
    
    var album: AlbumViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if album != nil {
            self.setupView()
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    deinit {
        print("AlbumViewController deinitiated")
    }
    
    
//     View's Properties
    var albumImageView: UIImageView = {
        let imageSize: CGFloat = UIScreen.main.bounds.width * 0.60
        let albumImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: imageSize, height: imageSize))
        albumImageView.layer.masksToBounds = true
        albumImageView.clipsToBounds = true
        albumImageView.autoresizingMask = .flexibleHeight
        albumImageView.contentMode = .scaleAspectFit
        albumImageView.translatesAutoresizingMaskIntoConstraints = false
        return albumImageView
    }()
    
    var albumNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var artistNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var copyrightLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var genreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var releasedAt: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var itunesButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("Open Album", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 18
        button.addTarget(self, action: #selector(goToAlbumPage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func goToAlbumPage() {
        if let url  = URL(string: "https://music.apple.com/us/album/jackboys/1492785997?app=music") {
            if UIApplication.shared.canOpenURL(url as URL) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    private func setupView() {
        
        self.view.addSubview(albumImageView)
        self.view.addSubview(albumNameLabel)
        self.view.addSubview(artistNameLabel)
        self.view.addSubview(genreLabel)
        self.view.addSubview(releasedAt)
        self.view.addSubview(copyrightLabel)
        self.view.addSubview(itunesButton)
        
        self.albumNameLabel.text = album.name
        self.artistNameLabel.text = "by \(album.artistName)"
        self.copyrightLabel.text = album.copyrightInfo
        self.genreLabel.text = album.genres
        self.releasedAt.text = "Released: \(album.releaseDate)"
        
        albumImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        albumImageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        albumImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        albumImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        
        albumNameLabel.topAnchor.constraint(equalTo: albumImageView.bottomAnchor, constant: 20).isActive = true
        albumNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        albumNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        
        artistNameLabel.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 20).isActive = true
        artistNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        
        genreLabel.topAnchor.constraint(equalTo: artistNameLabel.bottomAnchor, constant: 20).isActive = true
        genreLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        genreLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        
        releasedAt.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 20).isActive = true
        releasedAt.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        releasedAt.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        
        copyrightLabel.topAnchor.constraint(equalTo: releasedAt.bottomAnchor, constant: 20).isActive = true
        copyrightLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        copyrightLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        
        itunesButton.topAnchor.constraint(equalTo: copyrightLabel.bottomAnchor, constant: 20).isActive = true
        itunesButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        itunesButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        itunesButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20).isActive = true
        itunesButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
       ImageService.getImage(withStringURL: album.thumbnailImageURL) { [weak self] (image) in
           self?.albumImageView.image = image
       }
    }
}
