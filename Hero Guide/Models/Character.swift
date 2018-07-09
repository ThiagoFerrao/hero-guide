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
    var description: String?
    var thumbnailPath: String?
    var thumbnailExtension: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        description <- map["description"]
        thumbnailPath <- map["thumbnail.path"]
        thumbnailExtension <- map["thumbnail.extension"]
    }
    
    
    // MARK: Public Methods
    
    private func getImageURL(marvelImageParameter: String) -> URL? {
        var secureThumbnailPath = thumbnailPath
        
        if thumbnailPath?.contains("http://") ?? false {
            secureThumbnailPath = thumbnailPath?.replacingOccurrences(of: "http://", with: "https://", options: .literal)
        }
        
        let imageUrlString = "\(secureThumbnailPath ?? "")\(marvelImageParameter).\(thumbnailExtension ?? "")"
        return URL(string: imageUrlString)
    }
    
    func getStandardImageURL() -> URL? {
        return getImageURL(marvelImageParameter: Constants.IMAGE.MARVEL_PARAMETER.STANDARD)
    }
    
    func getLandscapeImageURL() -> URL? {
        return getImageURL(marvelImageParameter: Constants.IMAGE.MARVEL_PARAMETER.LANDSCAPE)
    }
}
