//
//  CartItemCollectionViewCell.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 11/8/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import Kingfisher
import UIKit

//parameter was previously SwipeableCollectionView
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
    
    let deleteImageView: UIImageView = {
        let image = UIImage(named: "delete")?.withRenderingMode(.alwaysTemplate)
        let imageView = UIImageView(image: image)
        imageView.tintColor = .white
        return imageView
    }()
    
    /*
    private func setupSubviews() {
        visibleContainerView.backgroundColor = .white
        visibleContainerView.addSubview(itemNameLabel)
        itemNameLabel.pinEdgesToSuperView()
        
     
     
        //Fix deleteImageView constraints
        hiddenContainerView.backgroundColor = UIColor(red: 231.0 / 255.0, green: 76.0 / 255.0, blue: 60.0 / 255.0, alpha: 1)
        hiddenContainerView.addSubview(deleteImageView)
        deleteImageView.translatesAutoresizingMaskIntoConstraints = false
        deleteImageView.centerXAnchor.constraint(equalTo: hiddenContainerView.centerXAnchor).isActive = true
        deleteImageView.centerYAnchor.constraint(equalTo: hiddenContainerView.centerYAnchor).isActive = true
        deleteImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        deleteImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
 */
}
