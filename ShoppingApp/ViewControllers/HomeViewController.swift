//
//  HomeViewController.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 8/29/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

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


