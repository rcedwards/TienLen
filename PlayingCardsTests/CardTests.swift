//
//  CardTests.swift
//  PlayingCards
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import XCTest

@testable import PlayingCards

class CardTests: XCTestCase {

    let aceOfSpades = Card(rank: .ace, suit: .spade)
    let aceOfHearts = Card(rank: .ace, suit: .heart)
    let aceOfHearts2 = Card(rank: .ace, suit: .heart)

    func testEquality() {
        XCTAssertNotEqual(aceOfSpades, aceOfHearts)
        XCTAssertEqual(aceOfHearts, aceOfHearts2)

        XCTAssertNotEqual(aceOfSpades.hashValue, aceOfHearts.hashValue)
        XCTAssertEqual(aceOfHearts.hashValue, aceOfHearts2.hashValue)
    }

    func testDescription() {
        let expectedDescription = "A ♥"
        let card = Card(rank: .ace, suit: .heart)
        XCTAssertEqual(expectedDescription, card.description)
        XCTAssertEqual(expectedDescription, card.debugDescription)
    }
}
