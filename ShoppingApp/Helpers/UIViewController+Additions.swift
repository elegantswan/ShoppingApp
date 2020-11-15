//
//  UIViewController+Additions.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 8/29/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

extension UIViewController {
    func navigationController() -> UINavigationController {
        return ShoppingNavigationController(rootViewController: self)
    }
}
