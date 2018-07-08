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
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    private var eventHandler: GalleryViewHandlerInterface?
    private let refreshControl = UIRefreshControl()
    private var characterList = [Character]()
    
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
    func showLoading() {
        loadingIndicator.isHidden = false
    }
    
    func hideLoading() {
        loadingIndicator.isHidden = true
    }
    
    func showCollectionView() {
        collectionView.isHidden = false
    }
    
    func hideCollectionView() {
        collectionView.isHidden = true
    }
    
    func endRefreshing() {
        refreshControl.endRefreshing()
    }
    
    func setupContent() {
        refreshControl.tintColor = UIColor(named: Constants.COLOR.ACCENT)
        refreshControl.addTarget(self, action: #selector(refreshCollectionRequested), for: .valueChanged)
        collectionView.bottomRefreshControl = refreshControl
    }
    
    func showAlert(_ alertController: UIAlertController) {
        present(alertController, animated: true, completion: nil)
    }
    
    func updateCharacterList(_ newCharacterList: [Character]) {
        characterList.append(contentsOf: newCharacterList)
        collectionView.reloadData()
    }
}


// MARK: UICollectionViewDataSource

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.REUSABLE_IDENTIFIER.GALLERY_CELL, for: indexPath) as! GalleryCollectionViewCell
        cell.character = characterList[indexPath.row]
        
        return cell
    }
}


// MARK: UICollectionViewDelegateFlowLayout

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 3, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
