//
//  GalleryViewInterface.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 08/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

protocol GalleryViewInterface {
    func showLoading()
    func hideLoading()
    func showCollectionView()
    func hideCollectionView()
    func setupContent()
    func showAlert(_ alertController: UIAlertController)
    func updateCharacterList(_ characterList: [Character])
}
