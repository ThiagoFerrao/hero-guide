//
//  Character.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 08/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation
import ObjectMapper

class Character: Mappable {
    var name: String?
    var thumbnailPath: String?
    var thumbnailExtension: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        thumbnailPath <- map["thumbnail.path"]
        thumbnailExtension <- map["thumbnail.extension"]
    }
}
