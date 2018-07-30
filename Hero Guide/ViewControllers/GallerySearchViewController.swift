//
//  GallerySearchViewController.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 29/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

class GallerySearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    public var searchDelegate: SearchDelegate?
    private var eventHandler: GallerySearchViewHandlerInterface?
    private var characterSearchList = [CharacterData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventHandler = GallerySearchPresenter(userInterface: self)
        eventHandler?.viewDidLoad()
    }
}


// MARK: GallerySearchViewInterface

extension GallerySearchViewController: GallerySearchViewInterface {
    func showLoading() {
        loadingIndicator.isHidden = false
    }
    
    func hideLoading() {
        loadingIndicator.isHidden = true
    }
    
    func showTableView() {
        tableView.isHidden = false
    }
    
    func hideTableView() {
        tableView.isHidden = true
    }
    
    func setupContent() {
        view.backgroundColor = UIColor(named: Constants.COLOR.BACKGROUND)?.withAlphaComponent(0.75)
    }
    
    func showMessage(_ message: String) {
        messageLabel.text = message
        messageLabel.isHidden = false
    }
    
    func hideMessage() {
        messageLabel.isHidden = true
    }
    
    func updateCharacterSearchList(_ newCharacterSearchList: [CharacterData]) {
        characterSearchList = newCharacterSearchList
        tableView.reloadData()
    }
    
    func presentCharacterScreen(send sendCharacter: CharacterData) {
        searchDelegate?.showCharacterScreen(send: sendCharacter)
    }
}


// MARK: UITableViewDataSource

extension GallerySearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterSearchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.REUSABLE_IDENTIFIER.GALLERY_SEARCH_CELL, for: indexPath) as! GallerySearchCell
        cell.character = characterSearchList[indexPath.row]
        
        return cell
    }
}


// MARK: UITableViewDelegate

extension GallerySearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eventHandler?.characterSelected(characterSearchList[indexPath.row])
    }
}


// MARK: UISearchResultsUpdating

extension GallerySearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}


// MARK: UISearchResultsUpdating

extension GallerySearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            eventHandler?.searchCanceled()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        eventHandler?.searchCanceled()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        eventHandler?.searchCharacter(searchBar.text ?? "")
    }
}
