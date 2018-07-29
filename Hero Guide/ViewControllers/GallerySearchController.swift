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
    
    private var characterSearchList = [CharacterData]()
    
    
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
        performSegue(withIdentifier: Constants.SEGUE_IDENTIFIER.TO_CHARACTER, sender: characterSearchList[indexPath.row])
    }
}


// MARK: UISearchResultsUpdating

extension GallerySearchController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}


// MARK: UISearchResultsUpdating

extension GallerySearchController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
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
