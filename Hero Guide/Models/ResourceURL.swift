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
    var url: URL?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        type <- map["type"]
        
        let transform = TransformOf<URL, String>(fromJSON: { (value: String?) -> URL? in
            guard let value = value else {
                return nil
            }
            return URL(string: value)
            
        }, toJSON: { (value: URL?) -> String? in
            guard let value = value else {
                return nil
            }
            return try? String(contentsOf: value)
        })
        
        url <- (map["url"], transform)
    }
}
