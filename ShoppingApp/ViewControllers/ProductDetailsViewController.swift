//
//  ProductDetailsViewController.swift
//  ShoppingApp
//

import Kingfisher
import UIKit

class ProductDetailsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var productTitleLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var addToCartButton: UIButton!
    @IBOutlet var priceLabel: UILabel!

    fileprivate let product: Product
    fileprivate var selectedCollectionItemIndexPath = IndexPath(row: 0, section: 0)

    init(product: Product, nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.product = product
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title = product.title
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        populateContent()
    }

    fileprivate func configureUI() {
        collectionView.isPagingEnabled = true
        collectionView?.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self

        mainImageView.contentMode = .scaleAspectFit
        mainImageView.backgroundColor = UIConfiguration.productDetailsScreenImageBackground

        productTitleLabel.font = UIConfiguration.productDetailsTitleFont
        productTitleLabel.textColor = UIConfiguration.productDetailsTextColor

        priceLabel.layer.borderColor = UIConfiguration.productDetailsPriceBorderColor.cgColor
        priceLabel.layer.borderWidth = 1
        priceLabel.layer.cornerRadius = 5
        priceLabel.font = UIConfiguration.productDetailsPriceFont
        priceLabel.textColor = UIConfiguration.productDetailsTextColor

        addToCartButton.backgroundColor = UIConfiguration.mainThemeColor
        addToCartButton.setTitleColor(.white, for: .normal)
        addToCartButton.layer.cornerRadius = 5
        addToCartButton.titleLabel?.font = UIConfiguration.productDetailsAddToCartButtonFont
        addToCartButton.addTarget(self, action: #selector(didTapAddToCartButton), for: .touchUpInside)

        descriptionLabel.textColor = UIConfiguration.productDetailsTextColor
    }

    fileprivate func populateContent() {
        priceLabel.text = "$" + product.price
        productTitleLabel.text = product.title
        addToCartButton.setTitle("Add to Cart", for: .normal)
        if let firstImageURLString = product.images.first {
            mainImageView.kf.setImage(with: URL(string: firstImageURLString))
        }
        descriptionLabel.text = product.productDescription
    }

    @objc func didTapAddToCartButton() {
        HostViewController.cartManager.addProduct(product: product)
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProductDetailsViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mainImageView.kf.setImage(with: URL(string: product.images[indexPath.row]))
        selectedCollectionItemIndexPath = indexPath
        collectionView.reloadData()
    }
}

extension ProductDetailsViewController {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.images.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath)
        if let imageCell = cell as? ImageCollectionViewCell  {
            imageCell.backgroundImageView.kf.setImage(with: URL(string: product.images[indexPath.row]))
            imageCell.configure(isSelected: (indexPath == selectedCollectionItemIndexPath))
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIConfiguration.productDetailsCollectionViewCellSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

}
