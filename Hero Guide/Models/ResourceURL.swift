//
//  ResourceURL.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 09/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation
import ObjectMapper

class ResourceURL: Mappable {
    var type: String?
    var url: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        type <- map["type"]
        url <- map["url"]
    }
}
