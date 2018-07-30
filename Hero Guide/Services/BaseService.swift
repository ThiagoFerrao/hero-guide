//
//  BaseService.swift
//  Hero Guide
//
//  Created by Thiago Ferrão on 08/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import Foundation
import Alamofire
import SwiftHash

class BaseService: NSObject {
    let SUCCESS_STATUS_CODE = 200...307
    typealias FAILURE_HANDLER = (Error) -> Void
    
    private let DEFAULT_HEADER: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    
    internal func createHeader() -> [String: String] {
        return DEFAULT_HEADER
    }
    
    internal func createUrlWithPath(_ path: String) -> String {
        return "\(Constants.API.URL)\(path)"
    }
    
    internal func getRequestTimeStampAndHashAndPublicKey() -> (String, String, String) {
        let timeStamp = Date().getTimeStamp()
        let privateKey = Constants.API.KEY.PRIVATE
        let publicKey = Constants.API.KEY.PUBLIC
        
        return (timeStamp, MD5(timeStamp + privateKey + publicKey).lowercased(), publicKey)
    }
}
