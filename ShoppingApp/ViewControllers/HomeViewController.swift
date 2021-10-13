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
    }
    
        @objc private func didDoubleTap(_ gesture: UITapGestureRecognizer) {
            view.backgroundColor = UIColor.red
            HapticsManager.shared.vibrate(for: .success)
        }
}

extension HomeViewController: UICollectionViewDataSource {
    
    //Template code from YouTube
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomepageScrollViewCustomCell.identifier, for: indexPath) as! HomepageScrollViewCustomCell
        collectionCell.data = self.data[indexPath.row]
        return collectionCell
    }
}
 
