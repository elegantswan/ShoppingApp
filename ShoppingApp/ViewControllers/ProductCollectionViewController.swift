//
//  ProductCollectionViewController.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 10/15/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

class ProductCollectionViewController: ATCGenericCollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIConfiguration.productScreenBackgroundColor
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let product = genericDataSource?.object(at: indexPath.row) as? Product {
            let productVC = ProductDetailsViewControllerFactory().productDetailsVC(product: product)
            self.navigationController?.pushViewController(productVC, animated: true)
        }
    }
}
