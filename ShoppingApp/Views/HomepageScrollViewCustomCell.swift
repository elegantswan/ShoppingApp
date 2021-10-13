//
//  HomepageScrollViewCell.swift
//  ShoppingApp
//
//  Created by Kevin Phan on 10/11/21.
//

import UIKit

class HomepageScrollViewCustomCell: UICollectionViewCell {
 
    static let identifier = "CustomCollectionViewCell"
    
    var data: ScrollViewImages? {
        didSet {
            guard let data = data else {return}
            scrollImageView.image = data.outfitImage
        }
    }
    
    fileprivate let scrollImageView: UIImageView = {
        let imageView:UIImageView = UIImageView()
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(scrollImageView)
        scrollImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        scrollImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        scrollImageView.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        scrollImageView.heightAnchor.constraint(equalToConstant: contentView.frame.height).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
