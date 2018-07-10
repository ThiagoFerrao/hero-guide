//
//  CharacterViewHandlerInterface.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 09/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

protocol CharacterViewHandlerInterface {
    func viewDidLoad(with character: CharacterData?)
    func readWikiButtonClicked()
}
