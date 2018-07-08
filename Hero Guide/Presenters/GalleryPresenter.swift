//
//  GalleryPresenter.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 08/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

class GalleryPresenter: NSObject {
    
    private var userInterface   : GalleryViewInterface?
    private var interactorInput : GalleryInteractorInput?
    
    init(userInterface: GalleryViewInterface) {
        super.init()
        
        self.userInterface = userInterface
        self.interactorInput = GalleryInteractor(output: self)
    }
    
}


// MARK: GalleryViewHandlerInterface

extension GalleryPresenter: GalleryViewHandlerInterface {
    func viewDidLoad() {
        userInterface?.setupContent()
        interactorInput?.loadCharacters()
    }
    
    func loadMoreData() {
        interactorInput?.loadCharacters()
    }
}


// MARK: GalleryInteractorOutput

extension GalleryPresenter: GalleryInteractorOutput {
    
}
