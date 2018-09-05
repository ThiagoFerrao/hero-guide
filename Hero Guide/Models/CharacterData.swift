//
//  CharacterData.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 08/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation
import ObjectMapper

class CharacterData: Mappable {
    var name: String?
    var description: String?
    var thumbnailPath: String?
    var thumbnailExtension: String?
    var comics: [ResourceData]?
    var series: [ResourceData]?
    var urls: [ResourceURL]?
    
    required init?(map: Map) {
        if let description = map.JSON["description"] as? String, description.isEmpty {
//            return nil
        }
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        
        if let context = map.context as? MappingContext, let characterName = name {
            name = context.characterNamePrefix + characterName
        }
        
        description <- map["description"]
        thumbnailPath <- map["thumbnail.path"]
        thumbnailExtension <- map["thumbnail.extension"]
        comics <- map["comics.items"]
        series <- map["series->items", delimiter: "->"]
        urls <- map["urls", nested: false]
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
    
    private func getResourceDataNames(from resourceDataList: [ResourceData]?) -> String? {
        guard let dataList = resourceDataList, !dataList.isEmpty else {
            return nil
        }
        
        var dataNameList = [String]()
        
        for data in dataList.prefix(5) {
            guard let dataName = data.name else {
                continue
            }
            
            dataNameList.append(dataName)
        }
        
        guard !dataNameList.isEmpty else {
            return nil
        }
        
        return dataNameList.joined(separator: "\n")
    }
    
    func getComicsNames() -> String? {
        return getResourceDataNames(from: comics)
    }

    func getSeriesNames() -> String? {
        return getResourceDataNames(from: series)
    }
    
    func getWikiURL() -> URL? {
        guard let resourceURLList = urls, !resourceURLList.isEmpty else {
            return nil
        }
        
        var wikiURL: URL?
        
        for resourceURL in resourceURLList {
            if resourceURL.type == "wiki" {
                wikiURL = resourceURL.url
                break
            }
        }
        
        return wikiURL
    }
}
