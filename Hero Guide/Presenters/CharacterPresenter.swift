//
//  CharacterPresenter.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 09/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

class CharacterPresenter: NSObject {
    
    private var userInterface: CharacterViewInterface?
    private var character: Character?
    private let dataNotFoundText = "Data not found :("
    
    init(userInterface: CharacterViewInterface) {
        super.init()
        
        self.userInterface = userInterface
    }
}


// MARK: CharacterViewHandlerInterface

extension CharacterPresenter: CharacterViewHandlerInterface {
    func viewDidLoad(with character: Character?) {
        self.character = character
        
        userInterface?.setNavigationTitle(with: character?.name ?? dataNotFoundText)
        userInterface?.setImageLayout()
        userInterface?.setCharacterImage(with: character?.getLandscapeImageURL())
        userInterface?.setCharacterNameLabel(with: character?.name ?? dataNotFoundText)
        let characterDescription = (character?.description?.isEmpty ?? true) ? dataNotFoundText : character?.description
        userInterface?.setCharacterDescriptionLabel(with: characterDescription ?? dataNotFoundText)
        userInterface?.setCharacterComicsLabel(with: character?.getComicsNames() ?? dataNotFoundText)
        userInterface?.setCharacterSeriesLabel(with: character?.getSeriesNames() ?? dataNotFoundText)
    }
    
    func readWikiButtonClicked() {
        guard let wikiURL = character?.getWikiURL() else {
            return
        }
        
        userInterface?.openURL(with: wikiURL)
    }
}
