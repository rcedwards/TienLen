//
//  SuitTests.swift
//  PlayingCards
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import XCTest

@testable import PlayingCards

class SuitTests: XCTestCase {
    
    func testSuitCount() {
        XCTAssertEqual(Suit.allSuits.count, 4)
    }

    func testDescription() {
        let heart = Suit.heart
        let expectedDescription = "♥"
        XCTAssertEqual(expectedDescription, heart.description)
        XCTAssertEqual(expectedDescription, heart.debugDescription)
    }

}
