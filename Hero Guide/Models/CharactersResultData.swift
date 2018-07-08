//
//  CharactersResultData.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 08/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation
import ObjectMapper

class CharactersResultData: Mappable {
    var characters: [Character]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        characters <- map["data.results"]
    }
}
