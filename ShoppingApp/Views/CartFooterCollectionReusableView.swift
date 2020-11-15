//
//  CartFooterCollectionReusableView.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 11/22/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

class CartFooterCollectionReusableView: UICollectionReusableView {
    @IBOutlet var totalPriceTextLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!

    func configure(totalPrice: Double) {
        priceLabel.text = "$" + String(Int(totalPrice))
        priceLabel.font = UIConfiguration.cartScreenFooterPriceFont
        priceLabel.textColor = UIConfiguration.cartScreenFooterPriceColor

        totalPriceTextLabel.text = "TOTAL PRICE"
        totalPriceTextLabel.font = UIConfiguration.cartScreenFooterTotalPriceTextFont
        totalPriceTextLabel.textColor = UIConfiguration.cartScreenFooterTotalPriceTextColor
    }
}
