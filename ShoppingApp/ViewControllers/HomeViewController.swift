//
//  HomeViewController.swift
//  ShoppingApp
//
//  Created by Florian Marcu on 8/29/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private func commonInit() {
        title = UIConfiguration.homeScreenTitle
        tabBarItem = UITabBarItem(title: UIConfiguration.homeTabBarItemTitle, image: UIConfiguration.homeTabBarItemImage, selectedImage: UIConfiguration.homeTabBarItemSelectedImage).tabBarWithNoTitle()
    }
    
    lazy var view0: UIView = {
        var view = UIView()
        view.backgroundColor = .systemRed
        return view
    }()
    
    lazy var view1: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    lazy var view2: UIView = {
        let view = UIView()
        view.backgroundColor = .systemTeal
        return view
    }()
    
    lazy var view3: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    lazy var views = [view0, view1, view2, view3]
    
    
    lazy var scrollView: UIScrollView = {
        
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        //scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: view.safeAreaLayoutGuide.layoutFrame.height)
        
        for i in 0 ..< views.count {
            scrollView.addSubview(views[i])
            views[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.safeAreaLayoutGuide.layoutFrame.height)
        }
        

        return scrollView
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
        view.addSubview(scrollView)
        scrollView.edgeTo(view: view)

    }
    /*
    private func commonInit() {
        title = UIConfiguration.homeScreenTitle
        tabBarItem = UITabBarItem(title: UIConfiguration.homeTabBarItemTitle, image: UIConfiguration.homeTabBarItemImage, selectedImage: UIConfiguration.homeTabBarItemSelectedImage).tabBarWithNoTitle()
    }
 */
}


