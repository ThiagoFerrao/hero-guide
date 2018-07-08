//
//  GalleryInteractor.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 08/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

class GalleryInteractor: NSObject {
    
    private var interactorOutput : GalleryInteractorOutput?
    private var currentOffSet = 0
    
    init(output: GalleryInteractorOutput) {
        super.init()
        
        self.interactorOutput = output
    }
}


// MARK: GalleryInteractorInput

extension GalleryInteractor: GalleryInteractorInput {
    func loadCharacters() {
        currentOffSet += 1
        CharactersService.shared.getCharacters(limit: Constants.API.LIMIT.DEFAULT, offSet: currentOffSet, apiKey: ""
            , success: { (characterList) in
                print(characterList)
                
        }) { (error) in
            print(error)
        }
    }
}
