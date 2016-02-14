//
//  CardTests.swift
//  TienLen
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import XCTest

@testable import PlayingCards

class CardTests: XCTestCase {

    let aceOfSpades = Card(rank: .Ace, suit: .Spade)
    let aceOfHearts = Card(rank: .Ace, suit: .Heart)
    let aceOfHearts2 = Card(rank: .Ace, suit: .Heart)

    func testEquality() {
        XCTAssertNotEqual(aceOfSpades, aceOfHearts)
        XCTAssertEqual(aceOfHearts, aceOfHearts2)

        XCTAssertNotEqual(aceOfSpades.hashValue, aceOfHearts.hashValue)
        XCTAssertEqual(aceOfHearts.hashValue, aceOfHearts2.hashValue)
    }

    func testDescription() {
        let expectedDescription = "A ♥"
        let card = Card(rank: .Ace, suit: .Heart)
        XCTAssertEqual(expectedDescription, card.description)
        XCTAssertEqual(expectedDescription, card.debugDescription)
    }
}
