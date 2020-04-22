//
//  DailySpecialsCell.swift
//  collectionViewTest
//
//  Created by Umer Khan on 22/04/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit

class DailySpecialsCell: UICollectionViewCell {
    var logo    = UIImageView()
     var label  = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLogo()
        configureLabel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureLogo() {
        contentView.addSubview(logo)
        // logo.backgroundColor = .purple
         logo.translatesAutoresizingMaskIntoConstraints = false
         logo.contentMode = .scaleAspectFit
         logo.clipsToBounds = true
         logo.layer.cornerRadius = logo.frame.height / 2
         
         logo.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 96, height: 96))
    }
    
    private func configureLabel() {
        contentView.addSubview(label)
        //label.backgroundColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(14)
        label.textAlignment = .center
        label.textColor = .black
        
        label.anchor(top: logo.bottomAnchor, leading: nil, bottom: contentView.bottomAnchor, trailing: nil, padding: .init(top: 12, left: 0, bottom: 08, right: 0), size: .init(width: 75, height: 16))
        
        label.centerXAnchor.constraint(equalTo: logo.centerXAnchor).isActive = true
    }
}
