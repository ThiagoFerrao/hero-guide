//
//  Constants.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 08/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation

struct Constants {
    
    struct API {
        static let URL = "http://gateway.marvel.com/v1/public"
        
        struct PATH {
            static let CHARACTERS = "/characters"
        }
        
        struct PARAMETERS {
            static let LIMIT = "limit"
            static let OFFSET = "offset"
            static let API_KEY = "apikey"
        }
    }
    
    struct SEGUE_IDENTIFIER {
        static let TO_CHARACTER = "SegueToCharacterVC"
    }
    
    struct REUSABLE_IDENTIFIER {
        static let GALLERY_CELL = "GalleryCell"
    }
}
