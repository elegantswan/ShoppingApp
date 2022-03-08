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
        //contentView.addSubview(highlightIndicator)
        contentView.clipsToBounds = true
        //self.addSubview(self.selectLabel)
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
    
    
    private let highlightIndicator: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = .red
        //Use this for opaque effect
        //myView.isOpaque = false
        //myView.alpha = CGFloat(0.5)
        return myView
    }()
    */
    func setup(with favorite: UIImage) {
        myImageView.image = favorite
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        myImageView.frame = CGRect(x: 5, y: 0, width: contentView.frame.width, height: contentView.frame.height)
        /*
        NSLayoutConstraint.activate([
            selectIndicator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            selectIndicator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            selectIndicator.widthAnchor.constraint(equalToConstant: 30),
            selectIndicator.heightAnchor.constraint(equalToConstant: 30),
            
            highlightIndicator.topAnchor.constraint(equalTo: contentView.topAnchor),
            highlightIndicator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            highlightIndicator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            highlightIndicator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
         */
    }
    /*
    override var isHighlighted: Bool {
        didSet {
            highlightIndicator.isHidden = !isHighlighted
        }
    }
    
    override var isSelected: Bool {
        didSet {
            highlightIndicator.isHidden = !isSelected
            selectIndicator.isHidden = !isSelected
        }
    }
     */
}
