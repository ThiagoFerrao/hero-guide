//
//  GalleryInteractor.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 08/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation
import SwiftHash

class GalleryInteractor: NSObject {
    
    private var interactorOutput : GalleryInteractorOutput?
    private var currentOffSet = 0
    
    init(output: GalleryInteractorOutput) {
        super.init()
        
        self.interactorOutput = output
    }
    
    
    // MARK: Private Methods
    
    private func incrementCurrentOffSetValue() {
        currentOffSet += 1
    }
    
    private func getRequestTimeStampAndHash() -> (String, String) {
        let timeStamp = Date().getTimeStamp()
        let privateKey = Constants.API.KEY.PRIVATE
        let publicKey = Constants.API.KEY.PUBLIC
        
        return (timeStamp, MD5(timeStamp + privateKey + publicKey).lowercased())
    }
}


// MARK: GalleryInteractorInput

extension GalleryInteractor: GalleryInteractorInput {
    func loadCharacters() {
        incrementCurrentOffSetValue()
        let (timeStamp, hash) = getRequestTimeStampAndHash()
        
        CharactersService.shared.getCharacters(limit: Constants.API.LIMIT.DEFAULT
            , offSet: currentOffSet
            , timeStamp: timeStamp
            , apiKey: Constants.API.KEY.PUBLIC
            , hash: hash
            , success: { (characterList) in
                print(characterList)
                
        }) { (error) in
            print(error)
        }
    }
}
