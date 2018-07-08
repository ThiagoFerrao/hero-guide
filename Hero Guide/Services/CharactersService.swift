//
//  CharactersService.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 08/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation
import Alamofire

class CharactersService: BaseService {
    
    static let shared = CharactersService()
    
    internal func getCharacters(limit: Int, offSet: Int, apiKey: String, success: @escaping ([Character]) -> Void, failure: @escaping FAILURE_HANDLER) {
        let requestHeader = self.createHeader()
        let requestUrl = self.createUrlWithPath(Constants.API.PATH.CHARACTERS)
        let requestParameters : [String : Any] = [
            Constants.API.PARAMETERS.LIMIT : limit,
            Constants.API.PARAMETERS.OFFSET : offSet,
            Constants.API.PARAMETERS.API_KEY : apiKey
        ]
        
        Alamofire.request(requestUrl, method: HTTPMethod.get, parameters: requestParameters, encoding: URLEncoding.queryString, headers: requestHeader)
            .validate(statusCode: SUCCESS_STATUS_CODE)
            .responseJSON { (dataResponse) in
                
                switch dataResponse.result {
                case .success(let result):
                    guard let jsonResult = result as? [String : Any] else {
                        failure(NSError(domain: "Unable to parse result to json", code: dataResponse.response?.statusCode ?? 0, userInfo: nil))
                        return
                    }
                    
                    guard let charactersResultData = CharactersResultData(JSON: jsonResult) else {
                        failure(NSError(domain: "Unable to parse json to model", code: dataResponse.response?.statusCode ?? 0, userInfo: nil))
                        return
                    }
                    
                    guard let characters = charactersResultData.characters else {
                        failure(NSError(domain: "Unable to get the character list from the charactersResultData", code: dataResponse.response?.statusCode ?? 0, userInfo: nil))
                        return
                    }
                    
                    success(characters)
                    
                case .failure(let error):
                    failure(error)
                }
        }
    }
}
