//
//  RankTests.swift
//  PlayingCards
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import XCTest

@testable import PlayingCards

class RankTests: XCTestCase {

    func testRankCount() {
        XCTAssertEqual(Rank.allRanks.count, 13)
    }

    func testDescription() {
        let ace = Rank.ace
        let expectedDescription = "A"
        XCTAssertEqual(expectedDescription, ace.description)
        XCTAssertEqual(expectedDescription, ace.debugDescription)
    }

}
