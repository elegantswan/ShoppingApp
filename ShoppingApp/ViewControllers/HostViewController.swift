//
//  HostViewController.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 8/29/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

class HostViewController: UIViewController, UITabBarControllerDelegate {

    let homeVC: UIViewController = HomeViewController()
    let categoriesVC: UIViewController = CategoriesViewController()
    let profileVC: UIViewController = ProfileViewController()
    static let cartManager: ATCShoppingCartManager = ATCShoppingCartManager()
    static let cartViewController: CartViewController = CartViewController(cartManager: cartManager)

    lazy var hostTabController: UIViewController = { [unowned self] in
        let tabBarController = UITabBarController()
        tabBarController.delegate = self
        //tabBarController.tabBar.barStyle = .default
        tabBarController.tabBar.isTranslucent = false
        tabBarController.viewControllers = [self.categoriesVC.navigationController(), self.homeVC.navigationController(), self.profileVC.navigationController()]
        return tabBarController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChildViewControllerWithView(hostTabController)
        HostViewController.cartManager.delegate = HostViewController.cartViewController
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIConfiguration.statusBarStyle
    }
}
