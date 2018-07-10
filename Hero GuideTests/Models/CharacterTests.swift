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
        let expectedImageString = "https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784" + Constants.IMAGE.MARVEL_PARAMETER.STANDARD + "." + "jpg"
        let expectedImageURl = URL(string: expectedImageString)
        let testImageURL = testCharacter?.getStandardImageURL()
        
        XCTAssert(expectedImageURl == testImageURL, "Expected standard image URL result is not matching the test")
    }
    
    func testGetLandscapeImageURL() {
        let expectedImageString = "https://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784" + Constants.IMAGE.MARVEL_PARAMETER.LANDSCAPE + "." + "jpg"
        let expectedImageURl = URL(string: expectedImageString)
        let testImageURL = testCharacter?.getLandscapeImageURL()
        
        XCTAssert(expectedImageURl == testImageURL, "Expected landscape image URL result is not matching the test")
    }
    
    func testGetComicsNames() {
        
        // Check Populated Comics Parameter
        
        var expectedComicsNames : String? = "Avengers: The Initiative (2007) #14\nAvengers: The Initiative (2007) #14 (SPOTLIGHT VARIANT)\nAvengers: The Initiative (2007) #15\nAvengers: The Initiative (2007) #16\nAvengers: The Initiative (2007) #17"
        var testComicsNames = testCharacter?.getComicsNames()
        
        XCTAssert(expectedComicsNames == testComicsNames, "Expected populated comics names result is not matching the test")
        
        // Check Empty Comics Parameter
        
        testCharacter?.comics = [ResourceData]()
        expectedComicsNames = nil
        testComicsNames = testCharacter?.getComicsNames()
        
        XCTAssert(expectedComicsNames == testComicsNames, "Expected empty comics names result is not matching the test")
        
        // Check Nil Comics Parameter
        
        testCharacter?.comics = nil
        expectedComicsNames = nil
        testComicsNames = testCharacter?.getComicsNames()
        
        XCTAssert(expectedComicsNames == testComicsNames, "Expected nil comics names result is not matching the test")
    }
    
    func testGetSeriesNames() {
        
        // Check Populated Series Parameter
        
        var expectedSeriesNames: String? = "Avengers: The Initiative (2007 - 2010)\nDeadpool (1997 - 2002)\nMarvel Premiere (1972 - 1981)"
        var testSeriesNames = testCharacter?.getSeriesNames()
        
        XCTAssert(expectedSeriesNames == testSeriesNames, "Expected populated series names result is not matching the test")
        
        // Check Empty Series Parameter
        
        testCharacter?.series = [ResourceData]()
        expectedSeriesNames = nil
        testSeriesNames = testCharacter?.getSeriesNames()
        
        XCTAssert(expectedSeriesNames == testSeriesNames, "Expected empty series names result is not matching the test")
        
        // Check Nil Series Parameter
        
        testCharacter?.series = nil
        expectedSeriesNames = nil
        testSeriesNames = testCharacter?.getSeriesNames()
        
        XCTAssert(expectedSeriesNames == testSeriesNames, "Expected nil series names result is not matching the test")
    }
    
    func testGetWikiURL() {
        
        // Check Populated Urls Parameter
        
        let expectedWikiString = "http://marvel.com/universe/3-D_Man_(Chandler)?utm_campaign=apiRef&utm_source=7e6505c9d7f0e89fac001bb8b163b70a"
        var expectedWikiURL = URL(string: expectedWikiString)
        var testWikiURL = testCharacter?.getWikiURL()
        
        XCTAssert(expectedWikiURL == testWikiURL, "Expected populated wiki URL result is not matching the test")
        
        // Check Empty Urls Parameter
        
        testCharacter?.urls = [ResourceURL]()
        expectedWikiURL = nil
        testWikiURL = testCharacter?.getWikiURL()
        
        XCTAssert(expectedWikiURL == testWikiURL, "Expected empty wiki URL result is not matching the test")
        
        // Check Nil Urls Parameter
        
        testCharacter?.urls = nil
        expectedWikiURL = nil
        testWikiURL = testCharacter?.getWikiURL()
        
        XCTAssert(expectedWikiURL == testWikiURL, "Expected nil wiki URL result is not matching the test")
    }
}
