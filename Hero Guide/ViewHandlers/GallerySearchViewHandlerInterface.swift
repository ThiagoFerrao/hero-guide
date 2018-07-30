//
//  GallerySearchViewHandlerInterface.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 30/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

protocol GallerySearchViewHandlerInterface {
    func viewDidLoad()
    func searchCharacter(_ searchValue: String)
    func characterSelected(_ characterSelected: CharacterData)
    func searchCanceled()
}
