//
//  CategoriesViewController.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 8/29/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    let categoriesVC: CategoriesCollectionViewController

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        let layout = ATCLiquidCollectionViewLayout()
        let configuration = ATCGenericCollectionViewControllerConfiguration(pullToRefreshEnabled: false, collectionViewLayout: layout) { (bounds) -> CGSize in
            return CGSize(width: bounds.width, height: UIConfiguration.categoryScreenCellHeight)
        }

        let categoriesFirebaseDataSource = ATCGenericFirebaseDataSource<Category>(tableName: "shopping_categories")

        categoriesVC = CategoriesCollectionViewController(configuration: configuration)
        categoriesVC.genericDataSource = categoriesFirebaseDataSource
        categoriesVC.use(adapter: CategoryRowAdapter(), for: "Category")
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        title = UIConfiguration.categoriesTitle
        tabBarItem = UITabBarItem(title: UIConfiguration.categoriesTabBarItemTitle, image: UIConfiguration.categoriesTabBarItemImage, selectedImage: UIConfiguration.categoriesTabBarItemSelectedImage).tabBarWithNoTitle()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.selectedIndex = 1
        self.addChildViewControllerWithView(categoriesVC)
    }
}
