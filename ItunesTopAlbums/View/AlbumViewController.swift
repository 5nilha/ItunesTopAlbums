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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = CGSize(width: self.view.bounds.width - 100, height: 1000)
    }
    
//     View's Properties
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.addSubview(backView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.frame = self.view.bounds
        scrollView.isScrollEnabled = true
       
        return scrollView
    }()

    
    private var backView: UIView {
        let backView = UIView()
        backView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 1000)
        backView.backgroundColor = .blue
        backView.addSubview(vStack)
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }
    
    private var vStack: UIStackView  {
        let topStack = UIStackView()
        topStack.translatesAutoresizingMaskIntoConstraints = false
        topStack.distribution = .fill
        topStack.alignment = .center
        topStack.axis = .vertical
        topStack.spacing = 20

        let firstStack = UIStackView()
        firstStack.distribution = .fillProportionally
        firstStack.alignment = .fill
        firstStack.axis = .vertical
        firstStack.spacing = 15
        
        let secondStack = UIStackView()
        secondStack.distribution = .fillProportionally
        secondStack.alignment = .fill
        secondStack.axis = .vertical
        secondStack.spacing = 10
        
        firstStack.addArrangedSubview(albumImageView)
        firstStack.addArrangedSubview(albumNameLabel)
        secondStack.addArrangedSubview(artistNameLabel)
        secondStack.addArrangedSubview(genreLabel)
        secondStack.addArrangedSubview(releasedAt)
        secondStack.addArrangedSubview(copyrightLabel)
        
        topStack.addArrangedSubview(firstStack)
        topStack.addArrangedSubview(secondStack)
        
        topStack.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 60).isActive = true
        return topStack
    }
    
    var albumImageView: UIImageView = {
        let imageSize: CGFloat = 150.0
        let albumImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: imageSize + 50.0, height: imageSize))
        albumImageView.layer.masksToBounds = true
        albumImageView.clipsToBounds = true
        albumImageView.autoresizingMask = .flexibleHeight
        albumImageView.contentMode = .scaleAspectFit
        return albumImageView
    }()
    var albumNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    
    var artistNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    var copyrightLabel: UILabel = {
        let label = UILabel(frame: CGRect(origin: .zero, size: CGSize(width: 150, height: 50)))
        label.numberOfLines = 4
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    var genreLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    var releasedAt: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 1
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    var itunesButton: UIButton {
        let btnHeight: CGFloat = 50
        let btnWidth: CGFloat = self.view.bounds.width - 40
        
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("Open Album", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = btnHeight / 2
        button.addTarget(self, action: #selector(goToAlbumPage), for: .touchUpInside)
        button.frame = CGRect(origin: CGPoint(x: 20, y: self.view.bounds.height - 60), size: CGSize(width: btnWidth, height: btnHeight))
        return button
    }
    
    @objc private func goToAlbumPage() {
        if let url  = URL(string: "https://music.apple.com/us/album/jackboys/1492785997?app=music") {
            if UIApplication.shared.canOpenURL(url as URL) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    private func setupView() {
        self.view.addSubview(scrollView)
    
//        self.view.addSubview(vStack)
//        self.view.addSubview(itunesButton)
        self.albumNameLabel.text = album.name
        self.artistNameLabel.text = "by \(album.artistName)"
        self.copyrightLabel.text = album.copyrightInfo
        self.genreLabel.text = album.genres
        self.releasedAt.text = "Released: \(album.releaseDate)"

        scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
       ImageService.getImage(withStringURL: album.thumbnailImageURL) { [weak self] (image) in
           self?.albumImageView.image = image
       }
    }
}
