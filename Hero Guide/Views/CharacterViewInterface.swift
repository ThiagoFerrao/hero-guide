//
//  CharacterViewInterface.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 09/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

protocol CharacterViewInterface {
    func setNavigationTitle(with value: String)
    func setImageLayout()
    func setCharacterImage(with value: URL?)
    func setCharacterNameLabel(with value: String)
    func setCharacterDescriptionLabel(with value: String)
    func setCharacterComicsLabel(with value: String)
    func setCharacterSeriesLabel(with value: String)
    func openURL(with value: URL)
}
