//
//  CategoryRowAdapter.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 11/11/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

class CategoryRowAdapter : ATCGenericCollectionRowAdapter {

    func configure(cell: UICollectionViewCell, with object: ATCGenericBaseModel) {
        guard let category = object as? Category, let cell = cell as? CategoryCollectionViewCell else { return }
        cell.backgroundImageView.kf.setImage(with: URL(string: category.imageURLString))
        cell.backgroundImageView.contentMode = .scaleAspectFit

        cell.categoryTitleLabel.text = category.title
        cell.categoryTitleLabel.textColor = UIConfiguration.categoryScreenTitleLabelColor
        cell.categoryTitleLabel.font = UIFont.boldSystemFont(ofSize: UIConfiguration.categoryScreenTitleLabelFontSize)
        cell.categoryTitleLabel.alpha = UIConfiguration.categoryScreenTitleLabelAlpha

        cell.categoryBackgroundView.backgroundColor = UIColor(hexString: category.colorString, alpha: UIConfiguration.categoryScreenColorAlpha)
    }

    func cellClass() -> UICollectionViewCell.Type {
        return CategoryCollectionViewCell.self
    }
}
