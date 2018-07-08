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
        static let URL = "https://gateway.marvel.com/v1/public"
        
        struct KEY {
            static let PRIVATE = "aba4decb92afadfd60d2d414bb45bbe88110e137"
            static let PUBLIC = "7e6505c9d7f0e89fac001bb8b163b70a"
        }
        
        struct PATH {
            static let CHARACTERS = "/characters"
        }
        
        struct PARAMETER {
            static let LIMIT = "limit"
            static let OFFSET = "offset"
            static let API_KEY = "apikey"
            static let HASH = "hash"
            static let TIME_STAMP = "ts"
        }
        
        struct LIMIT {
            static let DEFAULT = 15
        }
    }
    
    struct SEGUE_IDENTIFIER {
        static let TO_CHARACTER = "SegueToCharacterVC"
    }
    
    struct REUSABLE_IDENTIFIER {
        static let GALLERY_CELL = "GalleryCell"
    }
    
    struct COLOR {
        static let PRIMARY = "color_primary"
        static let ACCENT = "color_accent"
        static let BACKGROUND = "color_background"
    }
    
    struct IMAGE {
        static let APP_ICON = "icon_app"
        
        struct MARVEL_PARAMETER {
            static let STANDARD_PATH = "/standard_amazing"
        }
    }
}
