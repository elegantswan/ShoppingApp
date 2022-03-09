//
//  CustomCollectionViewCell.swift
//  ShoppingApp
//
//  Created by Kevin Phan on 11/15/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myImageView)
        //contentView.addSubview(selectIndicator)
        contentView.addSubview(highlightIndicator)
        contentView.clipsToBounds = true
        layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    /*
    private let selectIndicator: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "cancel")
        return imageView
    }()
    */
    
    private let highlightIndicator: UIView = {
        let myView = UIView()
        myView.isHidden = true
        myView.backgroundColor = UIConfiguration.mainThemeColor
        myView.isOpaque = true
        myView.alpha = CGFloat(0.5)
        return myView
    }()
    
    func setup(with favorite: UIImage) {
        myImageView.image = favorite
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        myImageView.frame = CGRect(x: 5, y: 0, width: contentView.frame.width, height: contentView.frame.height)
        highlightIndicator.frame = CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height)
    }
    
    override var isHighlighted: Bool {
        didSet {
            highlightIndicator.isHidden = !isHighlighted
            //print(highlightIndicator.isHidden)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            highlightIndicator.isHidden = !isSelected
            //print(highlightIndicator.isHidden)
            
        }
    }
}
