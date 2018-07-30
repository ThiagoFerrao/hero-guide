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
        userInterface?.hideMessage()
    }
    
    private func finishFullScreenLoading() {
        userInterface?.hideLoading()
        userInterface?.showTableView()
    }
}


// MARK: GallerySearchViewHandlerInterface

extension GallerySearchPresenter: GallerySearchViewHandlerInterface {
    func viewDidLoad() {
        userInterface?.setupContent()
        userInterface?.showMessage("Enter the hero name and click in the keyboard's search button to do the search :)")
    }
    
    func searchCharacter(_ searchValue: String) {
        startFullScreenLoading()
        interactorInput?.searchCharacter(searchValue)
    }
    
    func characterSelected(_ characterSelected: CharacterData) {
        userInterface?.presentCharacterScreen(send: characterSelected)
    }
}


// MARK: GallerySearchInteractorOutput

extension GallerySearchPresenter: GallerySearchInteractorOutput {
    func loadCharacters(_ characterSearchList: [CharacterData]) {
        userInterface?.updateCharacterSearchList(characterSearchList)
        finishFullScreenLoading()
    }
    
    func loadEmptyList() {
        userInterface?.hideLoading()
        userInterface?.showMessage("We were unable to find a hero with this name :(")
    }
    
    func requestFailed() {
        userInterface?.hideLoading()
        userInterface?.showMessage("An error occurred during the request :(\nPlease, try again later")
    }
}
