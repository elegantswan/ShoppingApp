//
//  ProfileViewController.swift
//  ShoppingApp
//
//  Created by Kevin Phan on 11/15/20.
//  Copyright © 2020 iOS App Templates. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //****New
    enum Mode {
        case view
        case select
    }
    
    //**New
    private var collectionView: UICollectionView?
    //Could delete if can use two nav buttons instead
    private var deleteButton: UIButton?
    
    //****New
    /*
    var viewMode: Mode = .view {
        didSet {
            switch viewMode {
            case .view:
                selectBarButton.title = "Select"
                navigationItem.leftBarButtonItem = nil
                collectionView?.allowsMultipleSelection = false
            case .select:
                selectBarButton.title = "Cancel"
                navigationItem.leftBarButtonItem = deleteBarButton
                collectionView?.allowsMultipleSelection = true
            }
        }
    }
    */
    lazy var selectBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(didSelectButtonClicked(_:)))
        return barButtonItem
    }()
    
    lazy var deleteBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didSelectDeleteButton(_:)))
        return barButtonItem
    }()
    //****New
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = UIConfiguration.profileTitle
        setupBarButtonItems()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 3
        layout.minimumInteritemSpacing = 3
        layout.itemSize = CGSize(width: (view.safeAreaLayoutGuide.layoutFrame.width/2) - 4, height: (view.safeAreaLayoutGuide.layoutFrame.width / 2) - 4)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.frame = view.safeAreaLayoutGuide.layoutFrame
    }
    
    private func setupBarButtonItems() {
        navigationItem.rightBarButtonItem = selectBarButton
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        sender.view?.removeFromSuperview()
    }
    
    @objc func didSelectButtonClicked(_ sender: UIBarButtonItem) {
        //viewMode = viewMode == .view ? .select : .view
    }
    
    @objc func didSelectDeleteButton(_ sender: UIBarButtonItem) {
        
    }
}

//*******Relook to see if reloadData is implemented correctly
extension ProfileViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.setup(with: favorites[indexPath.row])
        collectionView.reloadData()
                
        return cell
    }
}

extension ProfileViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let imageView = UIImageView(image: favorites[indexPath.row])
            imageView.frame = self.view.safeAreaLayoutGuide.layoutFrame
            imageView.backgroundColor = .black
            imageView.contentMode = .top
            imageView.isUserInteractionEnabled = true

            let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
            imageView.addGestureRecognizer(tap)

            self.view.addSubview(imageView)
        /*
        switch viewMode {
        case .view:
            let imageView = UIImageView(image: favorites[indexPath.row])
                imageView.frame = self.view.safeAreaLayoutGuide.layoutFrame
                imageView.backgroundColor = .black
                imageView.contentMode = .top
                imageView.isUserInteractionEnabled = true

                let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
                imageView.addGestureRecognizer(tap)

                self.view.addSubview(imageView)
        case .select:
            break
        }
        */
    }
}
