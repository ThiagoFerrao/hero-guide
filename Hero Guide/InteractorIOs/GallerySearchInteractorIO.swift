//
//  GallerySearchInteractorIO.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 30/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

protocol GallerySearchInteractorInput {
    func searchCharacter(_ searchValue: String)
}

protocol GallerySearchInteractorOutput {
    func loadCharacters(_ characterSearchList: [CharacterData])
    func loadEmptyList()
    func requestFailed(firstRequest: Bool)
}
