//
//  CategoriesCollectionViewController.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 11/11/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import Firebase
import UIKit

class CategoriesCollectionViewController: ATCGenericCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let category = self.genericDataSource?.object(at: indexPath.row) as? Category else { return }
        let path = "shopping_categories/\(category.key)/products"
        let productsVC = ProductCollectionViewControllerFactory.vc(title: category.title, firebasePath: path)
        self.parent?.navigationController?.pushViewController(productsVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.backgroundColor = UIConfiguration.categoryScreenBackgroundColor
        collectionView.showsVerticalScrollIndicator = false

    }
}
