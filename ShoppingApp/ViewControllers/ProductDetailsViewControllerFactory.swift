//
//  ProductDetailsViewControllerFactory.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 11/13/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

class ProductDetailsViewControllerFactory {
    func productDetailsVC(product: Product) -> ProductDetailsViewController {
        return ProductDetailsViewController(product: product, nibName: "ProductDetailsViewController", bundle: nil)
    }
}
