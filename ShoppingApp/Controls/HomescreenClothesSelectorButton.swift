//
//  HomescreenClothesSelectorButton.swift
//  ShoppingApp
//
//  Created by Kevin Phan on 10/13/21.
//  Copyright © 2021 iOS App Templates. All rights reserved.
//

import UIKit

class HomescreenClothesSelectorButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        //heightAnchor.constraint(equalToConstant: 0).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
