//
//  GalleryInteractor.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 08/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

class GalleryInteractor: NSObject {
    
    var interactorOutput : GalleryInteractorOutput?
    
    init(output: GalleryInteractorOutput) {
        super.init()
        
        self.interactorOutput = output
    }
}


// MARK: GalleryInteractorInput

extension GalleryInteractor: GalleryInteractorInput {
    
}
