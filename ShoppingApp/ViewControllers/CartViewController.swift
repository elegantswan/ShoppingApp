//
//  CartViewController.swift
//  ShoppingApp

import UIKit

class CartViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, ATCShoppingCartManagerDelegate {

    fileprivate let cartManager: ATCShoppingCartManager
    fileprivate let kCellReuseIdentifier = "CartItemCollectionViewCell"
    fileprivate let checkoutButton = UIButton()

    init(cartManager: ATCShoppingCartManager) {
        self.cartManager = cartManager
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        super.init(collectionViewLayout: layout)
        self.title = UIConfiguration.cartScreenTitle
        tabBarItem = UITabBarItem(title: UIConfiguration.cartTabBarItemTitle, image: UIConfiguration.cartTabBarItemImage, selectedImage: UIConfiguration.cartTabBarItemSelectedImage).tabBarWithNoTitle()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIConfiguration.cartScreenBackgroundColor
        collectionView?.register(UINib(nibName: kCellReuseIdentifier, bundle: nil), forCellWithReuseIdentifier: kCellReuseIdentifier)
        collectionView?.register(UINib(nibName: "CartFooterCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "CartFooterCollectionReusableView")
        collectionView.pinEdgesToSuperView()

        checkoutButton.backgroundColor = UIConfiguration.mainThemeColor
        checkoutButton.setTitleColor(.white, for: .normal)
        checkoutButton.layer.cornerRadius = 5
        checkoutButton.titleLabel?.font = UIConfiguration.cartScreenCheckoutButtonFont
        checkoutButton.addTarget(self, action: #selector(didTapCheckoutButton), for: .touchUpInside)
        checkoutButton.setTitle(UIConfiguration.cartScreenCheckoutButtonTitle, for: .normal)
        collectionView?.addSubview(checkoutButton)
        collectionView?.bringSubviewToFront(checkoutButton)

        checkoutButton.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            maker.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            maker.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            maker.height.equalTo(UIConfiguration.cartScreenCheckoutButtonHeight)
        }
    }

    @objc fileprivate func didTapCheckoutButton() {
        if cartManager.totalPrice() > 0 {
            let stripeSettingsVC = SettingsViewController()
            let stripeVC = CheckoutViewController(price: Int(cartManager.totalPrice() * 100), products: cartManager.distinctProducts(), settings: stripeSettingsVC.settings)
            stripeVC.title = "Checkout"
            self.navigationController?.pushViewController(stripeVC, animated: true)
        }
    }

    // MARK: - ATCShoppingCartManagerDelegate
    func cartManagerDidClearProducts(_ cartManager: ATCShoppingCartManager) {
        self.collectionView?.reloadData()
    }

    func cartManagerDidAddProduct(_ cartManager: ATCShoppingCartManager) {
        //print("right product added")
        self.collectionView?.reloadData()
    }
}

extension CartViewController {
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellReuseIdentifier, for: indexPath) as? CartItemCollectionViewCell else {
            fatalError()
        }
        let item = cartManager.object(at: indexPath.row)
        cell.configure(item: item)
        return cell
    }

    override open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cartManager.numberOfObjects()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: UIConfiguration.cartScreenCellHeight)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (kind == UICollectionView.elementKindSectionFooter) {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CartFooterCollectionReusableView", for: indexPath)
            if let footerView = footerView as? CartFooterCollectionReusableView {
                footerView.configure(totalPrice: cartManager.totalPrice())
            }
            return footerView
        }
        fatalError()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: UIConfiguration.cartScreenFooterCellHeight)
    }
    
    override func collectionView(_ collectionView: UICollectionView, canEditItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}

//REVIEW
extension CartViewController: SwipeableCollectionViewCellDelegate {
    func hiddenContainerViewTapped(inCell cell: UICollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        collectionView.performBatchUpdates({
            self.collectionView.deleteItems(at: [indexPath])
        })
    }
    
    func visibleContainerViewTapped(inCell cell: UICollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        print("Tapped item at index path: \(indexPath)")
    }
}
