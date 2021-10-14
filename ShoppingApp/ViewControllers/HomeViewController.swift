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
    //Top shirt button setup
    lazy var topButton: HomescreenClothesSelectorButton = {
        let button = HomescreenClothesSelectorButton(title: " df")
        let shirtButton = HomescreenClothesSelectorButton(type: UIButton.ButtonType.custom)
        topButton.setTitleColor(UIColor.red, for: .normal)
        /*
        let topImage = UIImage(named: "model")
        topButton.setImage(topImage, for: .normal)
         */
        return shirtButton
    }()
    //Bottom pants button setup
    lazy var bottomButton: HomescreenClothesSelectorButton = {
        let pantsButton = HomescreenClothesSelectorButton(title: "Button 2")
        pantsButton.setTitleColor(UIColor.red, for: .normal)
        /*
        let bottomImage = UIImage(imageLiteralResourceName: "bottoms-icon")
        bottomButton.setImage(bottomImage.withRenderingMode(.alwaysOriginal), for: .normal)
         */
        return pantsButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = UIConfiguration.homeScreenTitle
        
        //Change background color when implementing button to see position.
        view.backgroundColor = .white
        let homescreenModel = UIImage(named: "model")
        
        //Homescreen background setup
        let modelBackgroundView:UIImageView = UIImageView()
        modelBackgroundView.contentMode = UIView.ContentMode.scaleAspectFit
        modelBackgroundView.image = homescreenModel
        self.view = view
        view.addSubview(modelBackgroundView)
        modelBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        modelBackgroundView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        modelBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        modelBackgroundView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        modelBackgroundView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        
        //Scroll view setup
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.safeAreaLayoutGuide.layoutFrame.width,
                                 height: view.safeAreaLayoutGuide.layoutFrame.height)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(HomepageScrollViewCustomCell.self, forCellWithReuseIdentifier: HomepageScrollViewCustomCell.identifier)
        
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        collectionView.dataSource = self
        
        //Double tap implementation
        view.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(didDoubleTap(_:)))
        tapGesture.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapGesture)
        
        //Button setup
        setUpContraints()
    }
    
        @objc private func didDoubleTap(_ gesture: UITapGestureRecognizer) {
            //Confirms successful doubletap
            view.backgroundColor = UIColor.red
            HapticsManager.shared.vibrate(for: .success)
        }
    
    //MARK: Helpers
    
    func setUpContraints(){
        
        /*
        view.addSubview(topButton)
        topButton.translatesAutoresizingMaskIntoConstraints = false
        topButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        topButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        topButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true

        view.addSubview(topButton)
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        bottomButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        bottomButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomButton.topAnchor.constraint(equalTo: topButton.bottomAnchor, constant: 20).isActive = true
        */
        let stack = UIStackView(arrangedSubviews: [topButton, bottomButton])
        stack.axis = .vertical
        stack.spacing = 15
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.widthAnchor.constraint(equalToConstant: 725).isActive = true
        stack.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
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
 
