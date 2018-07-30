//
//  GallerySearchViewInterface.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 30/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

protocol GallerySearchViewInterface {
    func showLoading()
    func hideLoading()
    func showTableView()
    func hideTableView()
    func setupContent()
    func showMessage(_ message: String)
    func updateCharacterSearchList(_ newCharacterSearchList: [CharacterData])
    func presentCharacterScreen(send sendCharacter: CharacterData)
}
