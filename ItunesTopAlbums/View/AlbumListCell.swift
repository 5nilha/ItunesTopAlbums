//
//  AlbumListCell.swift
//  ItunesTopAlbums
//
//  Created by Fabio Quintanilha on 1/16/20.
//  Copyright © 2020 FabioQuintanilha. All rights reserved.
//

import UIKit

class AlbumListCell: UITableViewCell {
    
    static let cellIdentifier = "AlbumListCell"
    
    lazy var vStack: UIStackView = {
        let vStack = UIStackView()
        vStack.distribution = .fillProportionally
        vStack.alignment = .fill
        vStack.axis = .vertical
        vStack.spacing = 10

        vStack.addArrangedSubview(albumNameLabel)
        vStack.addArrangedSubview(artistNameLabel)
      
        vStack.translatesAutoresizingMaskIntoConstraints = false
        return vStack
    }()
    
    var albumImageView: UIImageView = {
        let imageSize: CGFloat = 80.0
          let albumImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: imageSize, height: imageSize))
          albumImageView.layer.masksToBounds = true
          albumImageView.layer.cornerRadius = 8.0
          albumImageView.clipsToBounds = true
          albumImageView.autoresizingMask = .flexibleHeight
          albumImageView.contentMode = .scaleAspectFit
          return albumImageView
      }()
      var albumNameLabel: UILabel = {
          let label = UILabel(frame: .zero)
          label.numberOfLines = 0
        label.textAlignment = .justified
          label.font = .systemFont(ofSize: 16, weight: .medium)
          return label
      }()
      
      var artistNameLabel: UILabel = {
          let label = UILabel(frame: .zero)
          label.numberOfLines = 1
          label.textAlignment = .justified
          label.font = .systemFont(ofSize: 13, weight: .regular)
          return label
      }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupUI(album: AlbumViewModel) {
        albumNameLabel.text = album.name
        artistNameLabel.text = "by \(album.artistName)"
        
        self.contentView.addSubview(albumImageView)
        self.contentView.addSubview(vStack)
        
        ImageService.getImage(withStringURL: album.thumbnailImageURL) { [weak self] (image) in
            self?.albumImageView.image = image
        }
        
        vStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: albumImageView.bounds.width + 20.0).isActive = true
        vStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        vStack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20).isActive = true
//        vStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10).isActive = true
    }
}
