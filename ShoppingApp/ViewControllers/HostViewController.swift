//
//  HostViewController.swift
//  ShoppingApp
//

import UIKit

class HostViewController: UIViewController, UITabBarControllerDelegate {

    //RELOOK AT THIS CODE
    let homeVC: UIViewController = HomeViewController(cartManager: cartManager)

    //RELOOK AT THIS CODE
    static let cartManager: ATCShoppingCartManager = ATCShoppingCartManager()
    let categoriesVC: UIViewController = CategoriesViewController()
    let profileVC: UIViewController = ProfileViewController()
    static let cartViewController: CartViewController = CartViewController(cartManager: cartManager)

    lazy var hostTabController: UIViewController = { [unowned self] in
        
        let tabBarController = UITabBarController()
        
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            
            tabBarController.tabBar.standardAppearance = appearance
            tabBarController.tabBar.scrollEdgeAppearance = appearance
        }
        
        tabBarController.delegate = self
        tabBarController.tabBar.isTranslucent = true
        tabBarController.viewControllers = [self.categoriesVC.navigationController(), self.homeVC.navigationController(), self.profileVC.navigationController()]
        return tabBarController
    }()
    
    func tabSetup() {
    
        let profileTabBarItem = UITabBarItem(title: UIConfiguration.profileTabBarItemTitle, image: UIConfiguration.profileTabBarItemImage, selectedImage: UIConfiguration.profileTabBarItemSelectedImage).tabBarWithNoTitle()
         
        
        let homeTabBarItem = UITabBarItem(title: UIConfiguration.homeTabBarItemTitle, image: UIConfiguration.homeTabBarItemImage, selectedImage: UIConfiguration.homeTabBarItemSelectedImage).tabBarWithNoTitle()
        
        profileVC.tabBarItem = profileTabBarItem
        homeVC.tabBarItem = homeTabBarItem
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChildViewControllerWithView(hostTabController)
        HostViewController.cartManager.delegate = HostViewController.cartViewController
        tabSetup()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIConfiguration.statusBarStyle
    }
}
