//
//  CharacterTests.swift
//  Hero GuideTests
//
//  Created by Thiago Ferrão on 09/07/18.
//  Copyright © 2018 Thiago Ferrão. All rights reserved.
//

import XCTest
@testable import Hero_Guide

class CharacterTests: XCTestCase {
    
    var testCharacter: CharacterData?
    
    override func setUp() {
        guard let dataAsset = NSDataAsset(name: "test_character") else {
            return XCTAssert(false, "Error while getting data asset")
        }
        
        do {
            let dataJSON = try JSONSerialization.jsonObject(with: dataAsset.data, options: .allowFragments) as? [String : Any] ?? [String : Any]()
            testCharacter = CharacterData(JSON: dataJSON)
        } catch {
            return XCTAssert(false, "Error while parsing data asset")
        }
    }
    
    func testGetStandardImageURL() {
        
    }
    
    func testGetLandscapeImageURL() {
        
    }
    
    func testGetComicsNames() {
        
    }
    
    func testGetSeriesNames() {
        
    }
    
    func testGetWikiURL() {
        
    }
}
