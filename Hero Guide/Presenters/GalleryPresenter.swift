//
//  GalleryPresenter.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 08/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import UIKit

class GalleryPresenter: NSObject {
    
    private var userInterface   : GalleryViewInterface?
    private var interactorInput : GalleryInteractorInput?
    
    init(userInterface: GalleryViewInterface) {
        super.init()
        
        self.userInterface = userInterface
        self.interactorInput = GalleryInteractor(output: self)
    }
    
    
    // MARK: Private Methods
    
    private func startFullScreenLoading() {
        userInterface?.hideCollectionView()
        userInterface?.showLoading()
    }
    
    private func finishFullScreenLoading() {
        userInterface?.hideLoading()
        userInterface?.showCollectionView()
    }
}


// MARK: GalleryViewHandlerInterface

extension GalleryPresenter: GalleryViewHandlerInterface {
    func viewDidLoad() {
        startFullScreenLoading()
        userInterface?.setupContent()
        interactorInput?.getCharacters()
    }
    
    func loadMoreData() {
        interactorInput?.getMoreCharacters()
    }
}


// MARK: GalleryInteractorOutput

extension GalleryPresenter: GalleryInteractorOutput {
    func loadCharacters(_ characterList: [Character]) {
        userInterface?.updateCharacterList(characterList)
        finishFullScreenLoading()
        userInterface?.endRefreshing()
    }
    
    func requestFailed() {
        userInterface?.endRefreshing()
        
        let alertController = UIAlertController(title: "Ops!"
            , message: "An error occurred during the request :(\nPlease, try again later"
            , preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default,handler: nil))
        
        userInterface?.showAlert(alertController)
    }
}
