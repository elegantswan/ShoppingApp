//
//  HomeViewController.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 8/29/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit
/*
 
 ***ScrollView implementation***
class HomeViewController: UIViewController {
 
    var pages : [ClothingScroll] {
        get {
            let page1: ClothingScroll = Bundle.main.loadNibNamed("ClothingScroll", owner: self, options: nil)?.first as! ClothingScroll
            page1.xibView.backgroundColor = UIColor.red
            
            let page2: ClothingScroll = Bundle.main.loadNibNamed("ClothingScroll", owner: self, options: nil)?.first as! ClothingScroll
            page2.xibView.backgroundColor = UIColor.white
            
            let page3: ClothingScroll = Bundle.main.loadNibNamed("ClothingScroll", owner: self, options: nil)?.first as! ClothingScroll
            page3.xibView.backgroundColor = UIColor.blue
            
            let page4: ClothingScroll = Bundle.main.loadNibNamed("ClothingScroll", owner: self, options: nil)?.first as! ClothingScroll
            page4.xibView.backgroundColor = UIColor.yellow
            
            let page5: ClothingScroll = Bundle.main.loadNibNamed("ClothingScroll", owner: self, options: nil)?.first as! ClothingScroll
            page5.xibView.backgroundColor = UIColor.green
                        
            return[page1,page2,page3,page4,page5]
        }
    }
    
    lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        //scrollView.showsVerticalScrollIndicator = false
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.safeAreaLayoutGuide.layoutFrame.height)

        
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(pages.count), height: view.safeAreaLayoutGuide.layoutFrame.height)
        
        for i in 0 ..< pages.count {
            scrollView.addSubview(pages[i])
            pages[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.safeAreaLayoutGuide.layoutFrame.height)
        }
        
        return scrollView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        view.addSubview(scrollView)
        setupScrollView(pages: pages)
        //scrollView.edgeTo(view: view)
    }
    
    //Relook at content size
    func setupScrollView(pages: [ClothingScroll]) {
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.safeAreaLayoutGuide.layoutFrame.height)
        //scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(pages.count), height: view.safeAreaLayoutGuide.layoutFrame.height - 180)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(pages.count), height: view.safeAreaLayoutGuide.layoutFrame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< pages.count {
            pages[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.safeAreaLayoutGuide.layoutFrame.height)
            scrollView.addSubview(pages[i])
        }
    }
    
    private func commonInit() {
        title = UIConfiguration.homeScreenTitle
        tabBarItem = UITabBarItem(title: UIConfiguration.homeTabBarItemTitle, image: UIConfiguration.homeTabBarItemImage, selectedImage: UIConfiguration.homeTabBarItemSelectedImage).tabBarWithNoTitle()
    }
}

*/


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
    
    
    
    //CollectionView integration with CartManager
    /*
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellReuseIdentifier, for: indexPath) as? CartItemCollectionViewCell else {
            fatalError()
        }
        let item = cartManager.object(at: indexPath.row)
        cell.configure(item: item)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cartManager.numberOfObjects()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    */
}

