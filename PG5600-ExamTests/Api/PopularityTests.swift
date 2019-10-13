//
//  PopularityTests.swift
//  PG5600-ExamTests
//
//  Created by Tom Fevang on 10/10/2019.
//  Copyright © 2019 Flowt. All rights reserved.
//

import XCTest
@testable import PG5600_Exam

class PopularityTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testGetTopFiftyTracksOfAllTime() {
        let expectation = self.expectation(description: #function)
        var tracks: [Track] = []
        PopularityApi.getTopFiftyTracksOfAllTime() { t in
            tracks = t
            expectation.fulfill()
        }
        waitForExpectations(timeout: 2, handler: nil)
        XCTAssert(tracks.count == 50, "Expected 50, recieved \(tracks.count)")
    }
}
