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
    
    
    // MARK: Private Methods
    
    private func incrementCurrentOffSetValue() {
        currentOffSet += 15
    }
    
    private func subtractCurrentOffSetValue() {
        currentOffSet -= 15
    }
}


// MARK: GalleryInteractorInput

extension GalleryInteractor: GalleryInteractorInput {
    func getCharacters() {
        CharactersService.shared.allCharacters(limit: Constants.API.LIMIT.DEFAULT
            , offSet: currentOffSet
            , success: { (characterList) in
                if characterList.isEmpty {
                    self.interactorOutput?.loadEmptyList()
                    return
                }
                
                self.interactorOutput?.loadCharacters(characterList)
                
        }) { (error) in
            if self.currentOffSet != 0 {
                self.subtractCurrentOffSetValue()
            }
            
            self.interactorOutput?.requestFailed(firstRequest: self.currentOffSet == 0)
        }
    }
    
    func getMoreCharacters() {
        incrementCurrentOffSetValue()
        getCharacters()
    }
}
