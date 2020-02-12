//
//  DataManagerTests.swift
//  ViaplayTests
//
//  Created by Sara Gharib on 2/12/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import XCTest

@testable import Viaplay

class DataManagerTests: XCTestCase {
    
    var dataManager: DataManager!
    
    override func setUp() {
        dataManager = DataManager()
    }
    
    func testGetSections() {
        
        // Create an expectation
        let expectation = self.expectation(description: "FetchSections")
        var allSections: [Section]?
        
        dataManager.getSections { (sections, error) in
            allSections = sections
            expectation.fulfill()
        }
        
        // Wait for expectation to be fullfilled or time out
        waitForExpectations(timeout: 8, handler: nil)
        
        // As the API already contains some data, allSections should not be nil
        XCTAssertNotNil(allSections)
    }
    
    func testGetSectionDetails() {
        
        // Create an expectation
        let expectation = self.expectation(description: "FetchSections")
        let section = Section(id:"35bb8a90-d40e-11e2-8b8b-0800200c9a66", page: "Serier", urlString: "https://content.viaplay.se/ios-se/serier{?dtg}", title: "", description: "")
        var sectionDetails: SectionDetail?
        
        dataManager.getSectionDetail(section: section) { (sectionDetail, error) in
            sectionDetails = sectionDetail
            expectation.fulfill()
        }
        
        // Wait for expectation to be fullfilled or time out
        waitForExpectations(timeout: 8, handler: nil)
        
        XCTAssertNotNil(sectionDetails)
    }
}

