//
//  ProductRowAdapter.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 10/15/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

class ProductRowAdapter: ATCGenericCollectionRowAdapter {

    func configure(cell: UICollectionViewCell, with object: ATCGenericBaseModel) {
        guard let product = object as? Product, let cell = cell as? ProductCollectionViewCell else { return }
        cell.productImageView.kf.setImage(with: URL(string: product.imageURLString))
        cell.productImageView.contentMode = .scaleAspectFit
        cell.productImageView.backgroundColor = .white
        cell.productImageView.layer.borderColor = UIConfiguration.productScreenImageViewBorderColor.cgColor
        cell.productImageView.layer.cornerRadius = 5
        cell.productImageView.layer.borderWidth = 0.5
        cell.containerView.backgroundColor = .clear

        cell.productTitleLabel.text = product.title
        cell.productTitleLabel.font = UIFont.systemFont(ofSize: UIConfiguration.productScreenTitleFontSize)
        cell.priceLabel.text = "$" + product.price
        cell.priceLabel.font = UIFont.boldSystemFont(ofSize: UIConfiguration.productScreenPriceFontSize)
    }

    func cellClass() -> UICollectionViewCell.Type {
        return ProductCollectionViewCell.self
    }
}
