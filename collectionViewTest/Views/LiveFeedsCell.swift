//
//  LiveFeedsCell.swift
//  collectionViewTest
//
//  Created by Umer Khan on 22/04/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit

class LiveFeedsCell: UICollectionViewCell {
    let imageCover      = UIView()
    var logo            = UIImageView()
     var label          = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageCover()
        configureLogo()
        configureLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLogo() {
        contentView.addSubview(logo)
        logo.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 08, left: 10, bottom: 0, right: 0), size: .init(width: 96, height: 96))
    }
    
    private func configureImageCover() {
        logo.addSubview(imageCover)
        imageCover.backgroundColor = UIColor(red: 0.5, green: 0, blue: 0, alpha: 0.5)
        //imageCover.layer.cornerRadius = contentView.frame.height / 2 - 1.1
        imageCover.layer.cornerRadius = 43.5
        
        imageCover.clipsToBounds = true
        imageCover.translatesAutoresizingMaskIntoConstraints = false
        imageCover.anchor(top: logo.topAnchor, leading: logo.leadingAnchor, bottom: logo.bottomAnchor, trailing: logo.trailingAnchor, size: .init(width: 96, height: 96))
    }
    
    
    
    private func configureLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        imageCover.addSubview(label)
        label.font = label.font.withSize(14)
        label.textAlignment = .center
        label.textColor = .white
        label.centerYAnchor.constraint(equalTo: imageCover.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: imageCover.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 70).isActive = true
        label.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
    }
}
