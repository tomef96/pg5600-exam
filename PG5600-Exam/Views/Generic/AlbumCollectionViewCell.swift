//
//  AlbumCollectionViewCell.swift
//  PG5600-Exam
//
//  Created by Tom Fevang on 13/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    var name: String?
    
    var artist: String?
    
    var image: UIImageView = {
        let image = UIImage(named: "testImage")!
        let view = UIImageView(image: image)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.cornerRadius = 4
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    var container: UIView = {
        let view = UIStackView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.container)
        self.container.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.container.leftAnchor.constraint(equalTo: self.contentView.leftAnchor).isActive = true
        self.container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        self.container.rightAnchor.constraint(equalTo: self.contentView.rightAnchor).isActive = true

        self.container.addSubview(self.image)
        self.image.widthAnchor.constraint(equalToConstant: 125).isActive = true
        self.image.heightAnchor.constraint(equalToConstant: 125).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
