//
//  ShoppingNavigationController.swift
//  ShoppingApp
//

import UIKit

class ShoppingNavigationController: UINavigationController {

    static var badgeButton = { () -> BadgedButton in
        let button = BadgedButton()
        button.setImage(UIConfiguration.navigationShoppingCartImage, for: .normal)
        button.setTitleColor(UIConfiguration.navigationBarTitleColor, for: .normal)
        button.addTarget(self, action: #selector(didTapShoppingCartButton), for: .touchUpInside)
        return button
    }()

    static let shoppingCartButton = UIBarButtonItem(customView: ShoppingNavigationController.badgeButton)

    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        rootViewController.navigationItem.rightBarButtonItem = ShoppingNavigationController.shoppingCartButton
        NotificationCenter.default.addObserver(self, selector:  #selector(didUpdateCart), name: kATCNotificationDidAddProductToCart, object: nil)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @objc
    private func didTapShoppingCartButton() {
        let cartVC = CartViewController(cartManager: HostViewController.cartManager)
        self.pushViewController(cartVC, animated: true)
    }

    @objc
    private func didUpdateCart() {
        ShoppingNavigationController.badgeButton.count = HostViewController.cartManager.numberOfObjects()
    }
}
