//
//  HomeViewController.swift
//  ShoppingApp
//

import UIKit

struct ScrollViewImages {
    var outfitImage: UIImage
}

class HomeViewController: UIViewController {
    
    let data = [
        ScrollViewImages(outfitImage: UIImage(imageLiteralResourceName: "1.Outfit")),
        ScrollViewImages(outfitImage: UIImage(imageLiteralResourceName: "1.Outfit")),
        ScrollViewImages(outfitImage: UIImage(imageLiteralResourceName: "1.Outfit")),
        ScrollViewImages(outfitImage: UIImage(imageLiteralResourceName: "1.Outfit"))
    ]
    
    let data2 = [
        ScrollViewImages(outfitImage: UIImage(imageLiteralResourceName: "2.Outfit")),
        ScrollViewImages(outfitImage: UIImage(imageLiteralResourceName: "3.Outfit")),
        ScrollViewImages(outfitImage: UIImage(imageLiteralResourceName: "4.Outfit"))
    ]
    
    //Homescreen background setup
    lazy var backgroundModel: UIImageView = {
        let modelBackgroundView = UIImageView()
        modelBackgroundView.contentMode = UIView.ContentMode.scaleAspectFit
        modelBackgroundView.image = UIImage(imageLiteralResourceName: "model")
        return modelBackgroundView
    }()
    
    func initBackgroundModel() {
        view.addSubview(backgroundModel)
        backgroundModel.translatesAutoresizingMaskIntoConstraints = false
        backgroundModel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundModel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundModel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        backgroundModel.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
    }
    
    //Scrollview setup
    lazy var topScrollView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width,
                                 height: view.safeAreaLayoutGuide.layoutFrame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView1 = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView1.register(HomepageScrollViewCustomCell.self, forCellWithReuseIdentifier: HomepageScrollViewCustomCell.topScrollViewIdentifier)
                                
        return collectionView1
    }()
    
    func initScrollView() {
        view.addSubview(topScrollView)

        //*************TAKE A LOOK AT THIS: FALSE LETS YOU CHANGE BUTTONS BUT NOT INTERACT WITH SCROLLVIEW
        topScrollView.backgroundColor = UIColor.clear
        topScrollView.translatesAutoresizingMaskIntoConstraints = false
        topScrollView.isPagingEnabled = true
        topScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topScrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        topScrollView.dataSource = self
    }
    
    lazy var bottomScrollView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width,
                                 height: view.safeAreaLayoutGuide.layoutFrame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView2 = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView2.register(SecondHomepageScrollViewCustomCell.self, forCellWithReuseIdentifier: SecondHomepageScrollViewCustomCell.bottomScrollViewIdentifier)
                        
        return collectionView2
    }()
    
    func initSecondScrollView() {
        view.addSubview(bottomScrollView)
        //************************************************TAKE A LOOK AT THIS
        bottomScrollView.backgroundColor = UIColor.clear
        bottomScrollView.translatesAutoresizingMaskIntoConstraints = false
        bottomScrollView.isPagingEnabled = true
        bottomScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        bottomScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomScrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        bottomScrollView.dataSource = self
    }
        
    //Top shirt button setup
    lazy var topButton: HomescreenClothesSelectorButton = {
        let button = HomescreenClothesSelectorButton(title: "Button 1")
        let topImage = UIImage(named: "top-filled-icon")
        button.setImage(topImage, for: .normal)
        return button
    }()
    
    //Bottom pants button setup
    lazy var bottomButton: HomescreenClothesSelectorButton = {
        let button = HomescreenClothesSelectorButton(title: "Button 2")
        
        let bottomImage = UIImage(imageLiteralResourceName: "bottoms-icon")
        button.setImage(bottomImage, for: .normal)
        return button
    }()
    
    
    //Top and bottom button implementation
    lazy var buttonStack: HomescreenClothesSelectorButton = {
        let button = HomescreenClothesSelectorButton(title: "Button 2")
        
        let bottomImage = UIImage(imageLiteralResourceName: "bottoms-icon")
        button.setImage(bottomImage, for: .normal)
        return button
    }()
    
    
    
    
    func buttonConstraints() {
        let stack = UIStackView(arrangedSubviews: [topButton, bottomButton])
        stack.axis = .vertical
        stack.spacing = 0
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        stack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -15).isActive = true
        stack.widthAnchor.constraint(equalToConstant: 25).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = UIConfiguration.homeScreenTitle
        
        //Change background color when implementing button to see position.
        view.backgroundColor = .white
        
        //Homescreen background setup
        initBackgroundModel()
        
        //Scroll view setup
        initSecondScrollView()
        initScrollView()
        
        //Button setup
        buttonConstraints()
        topButton.addTarget(self, action: #selector(topButtonClicked), for: .touchUpInside)
        bottomButton.addTarget(self, action: #selector(bottomButtonClicked), for: .touchUpInside)
        
        //Single tap implementation
        let singleTapGesture = UITapGestureRecognizer(target: self,
                                                          action: #selector(didTapView(_:)))
        singleTapGesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(singleTapGesture)
        
        //Double tap implementation
        let doubleTapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(didDoubleTap(_:)))
        doubleTapGesture.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTapGesture)
    }
    
    //MARK: Helpers
    @objc private func didTapView(_ sender: UITapGestureRecognizer) {
        //NEED TO CLEANER IMPLEMENTAION SINCE USER HAS TO TAP TWICE ON TOP BUTTON*********************************************************
        view.bringSubviewToFront(topButton)
        view.sendSubviewToBack(bottomScrollView)
        view.sendSubviewToBack(backgroundModel)
        view.backgroundColor = UIColor.blue
    }
    
    @objc private func didDoubleTap(_ gesture: UITapGestureRecognizer) {
        //Confirms successful doubletap
        view.backgroundColor = UIColor.red
        HapticsManager.shared.vibrate(for: .success)
    }

    //Change button state
    @objc func topButtonClicked() {
        topButton.setImage(UIImage(named: "top-filled-icon"), for: .normal)
        bottomButton.setImage(UIImage(named: "bottoms-icon"), for: .normal)
        //view.bringSubviewToFront(topScrollView)
        topScrollView.isScrollEnabled = true
        bottomScrollView.isScrollEnabled = false
        print("Top button pressed")
    }
    
    @objc func bottomButtonClicked() {
        topButton.setImage(UIImage(named: "top-icon"), for: .normal)
        bottomButton.setImage(UIImage(named: "bottoms-filled-icon"), for: .normal)
        view.bringSubviewToFront(bottomScrollView)
        topScrollView.isScrollEnabled = false
        bottomScrollView.isScrollEnabled = true
        print("Bottom button pressed")
    }
}

extension HomeViewController: UICollectionViewDataSource {
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         if collectionView == topScrollView {
             return data.count
         }
         return data2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topScrollView {
            let collectionCell = topScrollView.dequeueReusableCell(withReuseIdentifier: HomepageScrollViewCustomCell.topScrollViewIdentifier, for: indexPath) as! HomepageScrollViewCustomCell
            collectionCell.data = self.data[indexPath.row]
            
            return collectionCell
        } else {
            let collectionCell2 = bottomScrollView.dequeueReusableCell(withReuseIdentifier: SecondHomepageScrollViewCustomCell.bottomScrollViewIdentifier, for: indexPath) as! SecondHomepageScrollViewCustomCell
                collectionCell2.data = self.data2[indexPath.row]
            
            return collectionCell2
        }
    }
}
 
