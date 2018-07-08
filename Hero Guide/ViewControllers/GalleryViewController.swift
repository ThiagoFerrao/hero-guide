//
//  GalleryViewController.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 08/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit
import CCBottomRefreshControl

class GalleryViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var eventHandler: GalleryViewHandlerInterface?
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventHandler = GalleryPresenter(userInterface: self)
        eventHandler?.viewDidLoad()
    }
    
    
    // MARK: Private Methods
    
    @objc private func refreshCollectionRequested() {
        eventHandler?.loadMoreData()
    }
}


// MARK: GalleryViewInterface

extension GalleryViewController: GalleryViewInterface {
    func setupContent() {
        refreshControl.addTarget(self, action: #selector(refreshCollectionRequested), for: .valueChanged)
        collectionView.bottomRefreshControl = refreshControl
    }
}


// MARK: UICollectionViewDataSource

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}


// MARK: UICollectionViewDelegateFlowLayout

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
