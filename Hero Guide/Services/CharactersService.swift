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
    
    internal func allCharacters(limit: Int, offSet: Int
        , success: @escaping ([CharacterData]) -> Void
        , failure: @escaping FAILURE_HANDLER) {
        
        let requestHeader = self.createHeader()
        let requestParameters : [String : Any] = [
            Constants.API.PARAMETER.LIMIT : limit,
            Constants.API.PARAMETER.OFFSET : offSet,
        ]
        
        getCharacters(requestHeader: requestHeader, requestParameters: requestParameters, success: success, failure: failure)
    }
    
    internal func searchCharacters(searchValue: String
        , success: @escaping ([CharacterData]) -> Void
        , failure: @escaping FAILURE_HANDLER) {
        
        let requestHeader = self.createHeader()
        let requestParameters : [String : Any] = [
            Constants.API.PARAMETER.NAME : searchValue,
        ]
        
        getCharacters(requestHeader: requestHeader, requestParameters: requestParameters, success: success, failure: failure)
    }
    
    private func getCharacters(requestHeader: [String : String], requestParameters: [String : Any]
        , success: @escaping ([CharacterData]) -> Void
        , failure: @escaping FAILURE_HANDLER) {
        
        let (timeStamp, hash, apiKey) = getRequestTimeStampAndHashAndPublicKey()
        
        let defaultRequestParameters = [
            Constants.API.PARAMETER.API_KEY : apiKey,
            Constants.API.PARAMETER.HASH : hash,
            Constants.API.PARAMETER.TIME_STAMP : timeStamp
        ]
        
        let requestUrl = self.createUrlWithPath(Constants.API.PATH.CHARACTERS)
        let requestParameters = requestParameters.merging(defaultRequestParameters) { (current, _) in current }
        
        Alamofire.request(requestUrl, method: HTTPMethod.get, parameters: requestParameters, encoding: URLEncoding.queryString, headers: requestHeader)
            .validate(statusCode: SUCCESS_STATUS_CODE)
            .responseJSON { (dataResponse) in
                
                switch dataResponse.result {
                case .success(let result):
                    guard let jsonResult = result as? [String : Any] else {
                        failure(NSError(domain: "Unable to parse result to json", code: dataResponse.response?.statusCode ?? 0, userInfo: nil))
                        return
                    }
                    let mappingContext = MappingContext()
                    guard let charactersResultData = CharactersResultData<CharacterData>(JSON: jsonResult, context: mappingContext) else {
                        failure(NSError(domain: "Unable to parse json to model", code: dataResponse.response?.statusCode ?? 0, userInfo: nil))
                        return
                    }
                    
                    guard let characterList = charactersResultData.characters else {
                        failure(NSError(domain: "Unable to get the character list from the charactersResultData", code: dataResponse.response?.statusCode ?? 0, userInfo: nil))
                        return
                    }
                    
                    success(characterList)
                    
                case .failure(let error):
                    failure(error)
                }
        }
    }
}
