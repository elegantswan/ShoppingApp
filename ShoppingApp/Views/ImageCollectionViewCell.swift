//
//  ImageCollectionViewCell.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 11/18/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet var backgroundImageView: UIImageView!

    func configure(isSelected: Bool) {
        backgroundImageView.contentMode = .scaleAspectFit
        backgroundImageView.backgroundColor = UIConfiguration.productDetailsScreenImageBackground
        backgroundImageView.layer.cornerRadius = 5
        backgroundView?.backgroundColor = .black
        if (isSelected) {
            backgroundImageView.layer.borderColor = UIConfiguration.mainThemeColor.cgColor
            backgroundImageView.layer.borderWidth = 2.0
        } else {
            backgroundImageView.layer.borderColor = UIColor.clear.cgColor
            backgroundImageView.layer.borderWidth = 0.0
        }
    }
}
