//
//  PlaceTableViewCell.swift
//  Events
//
//  Created by Mihikaa Goenka on 5/1/19.
//  Copyright © 2019 Mihikaa Goenka. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    var nameLabel: UILabel!
    var PlaceImageView: UIImageView!
    
    let padding: CGFloat = 15
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont(name:"Open Sans-Bold", size: 40)
        nameLabel.textColor = .white
        
        PlaceImageView = UIImageView()
        PlaceImageView.translatesAutoresizingMaskIntoConstraints = false
        PlaceImageView.contentMode = .scaleAspectFill
        contentView.addSubview(PlaceImageView)
        contentView.backgroundColor = .clear
        
        if !UIAccessibility.isReduceTransparencyEnabled {
            let blurEffect = UIBlurEffect(style: .dark )
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = CGRect(x: 0.0, y: 90.0, width: 500, height: 60)
            blurEffectView.alpha = 0.7
            contentView.addSubview(blurEffectView)
            //if you have more UIViews, use an insertSubview API to place it where needed
        } else {
            contentView.backgroundColor = .black
        }
        contentView.addSubview(nameLabel)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            ])
        
        NSLayoutConstraint.activate([
            PlaceImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            PlaceImageView.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: padding),
            PlaceImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            //PlaceImageView.heightAnchor.constraint(equalToConstant: 20),
            PlaceImageView.widthAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.widthAnchor)
            ])
        
    }
    
    func configure(for place: Place) {
        nameLabel.text = place.name
        PlaceImageView.image = UIImage(named: place.placeimagestring)
    }
    
    
    // MARK: - Private Helpers
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
