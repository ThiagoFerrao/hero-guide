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
    private var characterList = [CharacterData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventHandler = GalleryPresenter(userInterface: self)
        eventHandler?.viewDidLoad()
    }
    
    
    // MARK: Private Methods
    
    @objc private func refreshCollectionRequested() {
        eventHandler?.loadMoreData()
    }
    
    
    // MARK: SEGUE
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Constants.SEGUE_IDENTIFIER.TO_CHARACTER:
            let sendCharacter = sender as? CharacterData
            let characterVC = segue.destination as? CharacterViewController
            
            characterVC?.character = sendCharacter
            
        default:
            return
        }
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
    
    func disableRefreshingControl() {
        collectionView.bottomRefreshControl = nil
    }
    
    func setupContent() {
        let storyBoard = UIStoryboard(name: Constants.STORYBOARD_IDENTIFIER.MAIN, bundle: nil)
        let gallerySearchController = storyBoard.instantiateViewController(withIdentifier: Constants.VIEW_CONTROLLER_IDENTIFIER.MAIN_STORYBOARD.GALLERY_SEARCH_CONTROLLER) as! GallerySearchController
        gallerySearchController.searchDelegate = self
        let searchController = UISearchController(searchResultsController: gallerySearchController)
        searchController.searchBar.delegate = gallerySearchController
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        refreshControl.tintColor = UIColor(named: Constants.COLOR.ACCENT)
        refreshControl.addTarget(self, action: #selector(refreshCollectionRequested), for: .valueChanged)
        collectionView.bottomRefreshControl = refreshControl
    }
    
    func showAlert(_ alertController: UIAlertController) {
        present(alertController, animated: true, completion: nil)
    }
    
    func updateCharacterList(_ newCharacterList: [CharacterData]) {
        characterList.append(contentsOf: newCharacterList)
        collectionView.reloadData()
    }
    
    func presentCharacterScreen(send sendCharacter: CharacterData) {
        performSegue(withIdentifier: Constants.SEGUE_IDENTIFIER.TO_CHARACTER, sender: sendCharacter)
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionElementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.REUSABLE_IDENTIFIER.COPYRIGHT_FOOTER_VIEW, for: indexPath)
            
            return footerView
            
        default:
            return UICollectionReusableView()
        }
    }
}


// MARK: UICollectionViewDelegateFlowLayout

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 3, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        eventHandler?.characterSelected(characterList[indexPath.row])
    }
}


// MARK: SearchDelegate

extension GalleryViewController: SearchDelegate {
    func showCharacterScreen(send sendCharacter: CharacterData) {
        presentCharacterScreen(send: sendCharacter)
    }
}
