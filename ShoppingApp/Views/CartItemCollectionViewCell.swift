//
//  CartItemCollectionViewCell.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 11/8/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import Kingfisher
import UIKit

class CartItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet var cartItemImageView: UIImageView!
    @IBOutlet var cartPriceLabel: UILabel!
    @IBOutlet var cartItemTitleLabel: UILabel!

    func configure(item: ATCShoppingCartItem) {
        cartItemImageView.kf.setImage(with: URL(string: item.product.cartImageURLString))
        cartItemImageView.contentMode = .scaleAspectFit
        cartPriceLabel.text = "$" + String(Int(item.product.cartPrice))
        cartItemTitleLabel.text = item.product.cartTitle

        cartPriceLabel.textColor = UIConfiguration.cartScreenPriceLabelColor
        cartPriceLabel.font = UIConfiguration.cartScreenPriceFont

        cartItemTitleLabel.font = UIConfiguration.cartScreenTitleFont
    }
}
