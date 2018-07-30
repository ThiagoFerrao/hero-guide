//
//  GallerySearchInteractor.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 30/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

class GallerySearchInteractor: NSObject {
    
    private var interactorOutput : GallerySearchInteractorOutput?
    
    init(output: GallerySearchInteractorOutput) {
        super.init()
        
        self.interactorOutput = output
    }
}


// MARK: GallerySearchInteractorInput

extension GallerySearchInteractor: GallerySearchInteractorInput {
    func searchCharacter(_ searchValue: String) {
        CharactersService.shared.searchCharacters(searchValue: searchValue
            , success: { (characterList) in
                guard !characterList.isEmpty else {
                    self.interactorOutput?.loadEmptyList()
                    return
                }
                
                self.interactorOutput?.loadCharacters(characterList)
                
        }) { (error) in
            self.interactorOutput?.requestFailed()
        }
    }
}
