//
//  HomeViewController.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 8/29/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

//***CollectionView Implemntation***
//class HomeViewController: UIViewController, UICollectionViewDelegateFlowLayout, ATCShoppingCartManagerDelegate

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = UIConfiguration.homeScreenTitle
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width, height: view.safeAreaLayoutGuide.layoutFrame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        collectionView.dataSource = self
    }
}

//extension HomeViewController:UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    
    //Template code from YouTube
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath)
        collectionCell.backgroundColor = [UIColor.green, .blue, .black, .yellow, .white].randomElement()
        return collectionCell
    }
}

