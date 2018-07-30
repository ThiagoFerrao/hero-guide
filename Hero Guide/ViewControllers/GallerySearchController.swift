//
//  GallerySearchController.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 29/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

class GallerySearchController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    public var searchDelegate: SearchDelegate?
    private var characterSearchList = [CharacterData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(named: Constants.COLOR.BACKGROUND)?.withAlphaComponent(0.75)
    }
}


// MARK: UITableViewDataSource

extension GallerySearchController: UITableViewDataSource {
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

extension GallerySearchController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchDelegate?.showCharacterScreen(send: characterSearchList[indexPath.row])
    }
}


// MARK: UISearchResultsUpdating

extension GallerySearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}


// MARK: UISearchResultsUpdating

extension GallerySearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.characterSearchList.removeAll()
            self.tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.characterSearchList.removeAll()
        self.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchValue = searchBar.text, !searchValue.isEmpty else {
            return
        }
        
        CharactersService.shared.searchCharacters(searchValue: searchValue
            , success: { (characterList) in
                self.characterSearchList = characterList
                self.tableView.reloadData()
                
        }) { (error) in
            self.characterSearchList.removeAll()
            self.tableView.reloadData()
        }
    }
}
