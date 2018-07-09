//
//  CharacterPresenter.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 09/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

class CharacterPresenter: NSObject {
    
    private var userInterface : CharacterViewInterface?
    private let dataNotFoundText = "Data not found :("
    
    init(userInterface: CharacterViewInterface) {
        super.init()
        
        self.userInterface = userInterface
    }
}


// MARK: CharacterViewHandlerInterface

extension CharacterPresenter: CharacterViewHandlerInterface {
    func viewDidLoad(with character: Character?) {
        userInterface?.setNavigationTitle(with: character?.name ?? dataNotFoundText)
        userInterface?.setImageLayout()
        userInterface?.setCharacterImage(with: character?.getLandscapeImageURL())
        userInterface?.setCharacterNameLabel(with: character?.name ?? dataNotFoundText)
        userInterface?.setCharacterDescriptionLabel(with: character?.description ?? dataNotFoundText)
        userInterface?.setCharacterComicsLabel(with: character?.getComicsNames() ?? dataNotFoundText)
        userInterface?.setCharacterSeriesLabel(with: character?.getSeriesNames() ?? dataNotFoundText)
    }
}
