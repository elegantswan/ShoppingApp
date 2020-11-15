//
//  WordPressPostAdapter.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 10/22/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

class WordPressPostAdapter: ATCGenericCollectionRowAdapter {
    func configure(cell: UICollectionViewCell, with object: ATCGenericBaseModel) {
        guard let post = object as? WordPressPost, let cell = cell as? ProductCollectionViewCell else { return }
        cell.productImageView.kf.setImage(with: URL(string: post.imageURLString))
        cell.productTitleLabel.text = post.title
    }

    func cellClass() -> UICollectionViewCell.Type {
        return ProductCollectionViewCell.self
    }
}
