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
        ScrollViewImages(outfitImage: UIImage(imageLiteralResourceName: "2.Outfit")),
        ScrollViewImages(outfitImage: UIImage(imageLiteralResourceName: "3.Outfit")),
        ScrollViewImages(outfitImage: UIImage(imageLiteralResourceName: "4.Outfit"))
    ]
    
    //Button states
    var topButtonIsPressed: Bool = false
    var bottomButtonIsPressed: Bool = false
    
    //Homescreen background setup
    lazy var backgroundModel: UIImageView = {
        let modelBackgroundView = UIImageView()
        modelBackgroundView.contentMode = UIView.ContentMode.scaleAspectFit
        modelBackgroundView.image = UIImage(imageLiteralResourceName: "model")
    
        return modelBackgroundView
    }()
    
    func initBackGroundModel() {
        view.addSubview(backgroundModel)

        backgroundModel.translatesAutoresizingMaskIntoConstraints = false
        backgroundModel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        backgroundModel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backgroundModel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        backgroundModel.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
    }
    
    //Scrollview setup
    lazy var scrollView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width,
                                 height: view.safeAreaLayoutGuide.layoutFrame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView1 = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView1.register(HomepageScrollViewCustomCell.self, forCellWithReuseIdentifier: HomepageScrollViewCustomCell.identifier)
        
        return collectionView1
    }()
    
    func initScrollView() {
        view.addSubview(scrollView)
        scrollView.backgroundColor = UIColor.clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        scrollView.dataSource = self
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
    
    func buttonConstraints(){
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
    
    func connectScrollViewWithButton () {
        if bottomButtonIsPressed == false {
            scrollView.isScrollEnabled = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = UIConfiguration.homeScreenTitle
        self.view = view

        //Change background color when implementing button to see position.
        view.backgroundColor = .white
        //let homescreenModel = UIImage(named: "model")
        
        //Homescreen background setup
        initBackGroundModel()

        //Scroll view setup
        initScrollView()
        
        connectScrollViewWithButton()
        
        //Double tap implementation
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(didDoubleTap(_:)))
        tapGesture.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapGesture)
        
        //Button setup
        buttonConstraints()
        
        topButton.addTarget(self, action: #selector(topButtonClicked), for: .touchUpInside)
        bottomButton.addTarget(self, action: #selector(bottomButtonClicked), for: .touchUpInside)
    }
    
    @objc private func didDoubleTap(_ gesture: UITapGestureRecognizer) {
        //Confirms successful doubletap
        view.backgroundColor = UIColor.red
        HapticsManager.shared.vibrate(for: .success)
    }
    
    //MARK: Helpers
    

    //Change button state
    @objc func topButtonClicked(){
        topButtonIsPressed = true
        bottomButtonIsPressed = false
        topButton.setImage(UIImage(named: "top-filled-icon"), for: .normal)
        bottomButton.setImage(UIImage(named: "bottoms-icon"), for: .normal)
        
        //scrollView1.isScrollEnabled = false
        
        print("Top button pressed")
    }
    
    @objc func bottomButtonClicked(){
        topButtonIsPressed = false
        bottomButtonIsPressed = true
        topButton.setImage(UIImage(named: "top-icon"), for: .normal)
        bottomButton.setImage(UIImage(named: "bottoms-filled-icon"), for: .normal)
        
        print("Bottom button pressed")
    }
}

extension HomeViewController: UICollectionViewDataSource {
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomepageScrollViewCustomCell.identifier, for: indexPath) as! HomepageScrollViewCustomCell
        collectionCell.data = self.data[indexPath.row]
        return collectionCell
    }
}
 
