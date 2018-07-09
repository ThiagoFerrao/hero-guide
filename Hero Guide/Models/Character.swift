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
    var comics: [ResourceData]?
    var series: [ResourceData]?
    var urls: [ResourceURL]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        description <- map["description"]
        thumbnailPath <- map["thumbnail.path"]
        thumbnailExtension <- map["thumbnail.extension"]
        comics <- map["comics.items"]
        series <- map["series.items"]
        urls <- map["urls"]
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
        
        var wikiURL: String?
        
        for resourceURL in resourceURLList {
            if resourceURL.type == "wiki" {
                wikiURL = resourceURL.url
                break
            }
        }
        
        return URL(string: wikiURL ?? "")
    }
}
