//
//  ViaplayTests.swift
//  ViaplayTests
//
//  Created by Sara Gharib on 2/12/20.
//  Copyright © 2020 Sara Gharib. All rights reserved.
//

import XCTest

@testable import Viaplay

class NetworkingTests: XCTestCase {
    
    var networking: Networking!
    
    override func setUp() {
    }
    
    func testSuccessFetchData() {
        
        // Create an expectation
        let expectation = self.expectation(description: "FetchSections")
        var sectionData: Data?
        
        Networking.fetchData(urlString: viaplayURL) { (data, error) in
            sectionData = data
            expectation.fulfill()
        }
        
        // Wait for expectation to be fullfilled or time out
        waitForExpectations(timeout: 8, handler: nil)
        
        // As the API already contains some data, sectionData should not be nil
        XCTAssertNotNil(sectionData)
    }
    
    func testFailedFetchData() {
        
        // Create an expectation
        let expectation = self.expectation(description: "FetchSections")
        var viaplayError: ViaplayError?
        
        Networking.fetchData(urlString: "content.viaplay.se/ios-se-wrongAPI") { (data, error) in
            viaplayError = error
            expectation.fulfill()
        }
        
        // Wait for expectation to be fullfilled or time out
        waitForExpectations(timeout: 8, handler: nil)
        
        
        XCTAssertNotNil(viaplayError)
    }
}
