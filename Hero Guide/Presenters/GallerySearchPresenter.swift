//
//  GallerySearchPresenter.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 30/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

class GallerySearchPresenter: NSObject {
    
    private var userInterface : GallerySearchViewInterface?
    private var interactorInput : GallerySearchInteractorInput?
    
    init(userInterface: GallerySearchViewInterface) {
        super.init()
        
        self.userInterface = userInterface
        self.interactorInput = GallerySearchInteractor(output: self)
    }
    
    
    // MARK: Private Methods
    
    private func startFullScreenLoading() {
        userInterface?.hideTableView()
        userInterface?.showLoading()
    }
    
    private func finishFullScreenLoading() {
        userInterface?.hideLoading()
        userInterface?.showTableView()
    }
}


// MARK: GallerySearchViewHandlerInterface

extension GallerySearchPresenter: GallerySearchViewHandlerInterface {
    func viewDidLoad() {
        
    }
    
    func searchCharacter(_ searchValue: String) {
        
    }
    
    func characterSelected(_ characterSelected: CharacterData) {
        
    }
}


// MARK: GallerySearchInteractorOutput

extension GallerySearchPresenter: GallerySearchInteractorOutput {
    func loadCharacters(_ characterSearchList: [CharacterData]) {
        
    }
    
    func loadEmptyList() {
        
    }
    
    func requestFailed(firstRequest: Bool) {
        
    }
}
