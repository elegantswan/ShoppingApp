//
//  UIConfiguration.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 8/29/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

class UIConfiguration {
    // General
    static let mainThemeColor = UIColor(hexString: "#ffcb69", alpha: 1) // green = #A7C51A

    // Navigation
    static let navigationBarBackgroundColor = mainThemeColor
    static let navigationBarTitleColor = UIColor.white
    static let navigationShoppingCartImage = UIImage.localImage("shopping-bag-filled-icon", template: true)
    static let navigationShoppingCartBadgedCountBackgroundColor = UIColor.red
    static let navigationShoppingCartBadgedCountTextColor = UIColor.white

    // Status bar
    static let statusBarStyle: UIStatusBarStyle = .lightContent

    // Home screen
    static let homeScreenTitle = "" //Replace with logo
    static let categoriesTitle = "Shop"
    static let profileTitle = "Lookbook"


    // Tab bar
    static let tabBarTintColor = mainThemeColor
    static let tabBarBarTintColor = UIColor.white
    static let tabBarBarUnselectedItemTintColor = mainThemeColor

    static let homeTabBarItemTitle = "" //Replaced with space to remove text in tab bar
    static let homeTabBarItemImage: UIImage = .localImage("home-icon")
    static let homeTabBarItemSelectedImage: UIImage = .localImage("home-filled-icon")

    static let categoriesTabBarItemTitle = "" //Replaced with space to remove text in tab bar
    static let categoriesTabBarItemImage: UIImage = .localImage("shopping-bag-icon")
    static let categoriesTabBarItemSelectedImage: UIImage = .localImage("shopping-bag-filled-icon")
    
    static let profileTabBarItemTitle = "" //Replaced with space to remove text in tab bar
    static let profileTabBarItemImage: UIImage = .localImage("cloakroom-icon")
    static let profileTabBarItemSelectedImage: UIImage = .localImage("cloakroom-filled-icon")

    static let cartTabBarItemTitle = "Cart"
    static let cartTabBarItemImage: UIImage = .localImage("shopping-bag-icon")
    static let cartTabBarItemSelectedImage: UIImage = .localImage("shopping-bag-filled-icon")

    // Category screen
    static let categoryScreenColorAlpha: CGFloat = 0.5
    static let categoryScreenTitleLabelColor: UIColor = .white
    static let categoryScreenTitleLabelFontSize: CGFloat = 20
    static let categoryScreenTitleLabelAlpha: CGFloat = 0.75
    static let categoryScreenCellHeight: CGFloat = 150
    static let categoryScreenBackgroundColor = UIColor(displayP3Red: 246/255, green: 244/255, blue: 249/255, alpha: 1)

    // Product list screen
    static let productScreenCellHeight: CGFloat = 200
    static let productScreenCellWidth: CGFloat = 150
    static let productScreenBackgroundColor = UIColor(displayP3Red: 246/255, green: 244/255, blue: 249/255, alpha: 1)
    static let productScreenPriceFontSize: CGFloat = 16
    static let productScreenTitleFontSize: CGFloat = 14
    static let productScreenImageViewBorderColor = UIColor(displayP3Red: 169/255, green: 171/255, blue: 173/255, alpha: 1)

    // Product Details screen
    static let productDetailsScreenImageBackground: UIColor = UIColor(hexString: "#F6F4F9", alpha: 0.6)
    static let productDetailsCollectionViewCellSize: CGSize = CGSize(width: 80, height: 80)
    static let productDetailsTitleFont: UIFont = UIFont.boldSystemFont(ofSize: 20)
    static let productDetailsPriceBorderColor = UIColor(hexString: "#cccccc")
    static let productDetailsTextColor = UIColor(hexString: "#56526D")
    static let productDetailsPriceFont: UIFont = UIFont.boldSystemFont(ofSize: 20)
    static let productDetailsAddToCartButtonFont: UIFont = UIFont.boldSystemFont(ofSize: 16)

    // Cart Screen
    static let cartScreenCellHeight: CGFloat = 63.0
    static let cartScreenFooterCellHeight: CGFloat = 63.0
    static let cartScreenBackgroundColor = UIColor.white
    static let cartScreenTitle = "Shopping Cart"
    static let cartScreenPriceLabelColor = UIColor(hexString: "#666666")
    static let cartScreenTitleFont: UIFont = UIFont.boldSystemFont(ofSize: 16)
    static let cartScreenPriceFont: UIFont = UIFont.boldSystemFont(ofSize: 14)
    static let cartScreenFooterPriceFont: UIFont = UIFont.boldSystemFont(ofSize: 18)
    static let cartScreenFooterTotalPriceTextFont: UIFont = UIFont.boldSystemFont(ofSize: 14)
    static let cartScreenFooterPriceColor = UIColor(hexString: "#56526D")
    static let cartScreenFooterTotalPriceTextColor = UIColor(hexString: "#666666")
    static let cartScreenCheckoutButtonFont: UIFont = UIFont.boldSystemFont(ofSize: 16)
    static let cartScreenCheckoutButtonHeight: CGFloat = 60.0
    static let cartScreenCheckoutButtonTitle: String = "Checkout"

    static func configureUI() {
        UINavigationBar.appearance().barTintColor = UIConfiguration.navigationBarBackgroundColor
        UINavigationBar.appearance().tintColor = UIConfiguration.navigationBarTitleColor

        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIConfiguration.navigationBarTitleColor]
        UINavigationBar.appearance().isTranslucent = false

        UITabBar.appearance().tintColor = UIConfiguration.tabBarTintColor
        UITabBar.appearance().barTintColor = UIConfiguration.tabBarBarTintColor
        
        if #available(iOS 10.0, *) {
            UITabBar.appearance().unselectedItemTintColor = UIConfiguration.tabBarBarUnselectedItemTintColor
        }
        
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = mainThemeColor
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().standardAppearance = appearance
        }
    }
}
