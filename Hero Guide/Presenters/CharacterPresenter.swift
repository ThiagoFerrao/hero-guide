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
    
    init(userInterface: CharacterViewInterface) {
        super.init()
        
        self.userInterface = userInterface
    }
}


// MARK: CharacterViewHandlerInterface

extension CharacterPresenter: CharacterViewHandlerInterface {
    func viewDidLoad() {
        userInterface?.setupContent()
    }
}
