//
//  ProductCollectionViewControllerFactory.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 11/11/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

class ProductCollectionViewControllerFactory {
    class func vc(title: String, firebasePath: String) -> ProductCollectionViewController {
        let dataSource = ATCGenericFirebaseDataSource<Product>(tableName: firebasePath)
        let productRowAdapter = ProductRowAdapter()
        let layout = ATCLiquidCollectionViewLayout(cellPadding: 10.0)
        let productVCConfiguration = ATCGenericCollectionViewControllerConfiguration(pullToRefreshEnabled: false, collectionViewLayout: layout) { (bounds) -> CGSize in
            return CGSize(width: UIConfiguration.productScreenCellWidth, height: UIConfiguration.productScreenCellHeight)
        }

        let productsVC = ProductCollectionViewController(configuration: productVCConfiguration)
        productsVC.genericDataSource = dataSource
        productsVC.use(adapter: productRowAdapter, for: "Product")
        productsVC.title = title
        return productsVC
    }
}
