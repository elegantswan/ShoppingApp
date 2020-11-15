//
//  DumbViewController.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 9/2/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

class DumbViewController: UIViewController {
    let color: UIColor

    init(_ title: String, _ color: UIColor) {
        self.color = color
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = color
    }
}
