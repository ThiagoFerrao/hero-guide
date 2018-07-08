//
//  GalleryInteractorIO.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 08/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

protocol GalleryInteractorInput {
    func getCharacters()
    func getMoreCharacters()
}

protocol GalleryInteractorOutput {
    func loadCharacters(_ characterList: [Character])
    func requestFailed()
}
