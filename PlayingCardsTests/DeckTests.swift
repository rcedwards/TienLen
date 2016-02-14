//
//  DeckTests.swift
//  PlayingCards
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import XCTest

@testable import PlayingCards

class DeckTests: XCTestCase {

    var deck: Deck!

    override func setUp() {
        super.setUp()

        deck = Deck()
    }

    func testInitialization() {
        XCTAssertEqual(deck.cards.count, 52)
    }

    func testDrawingThroughDeck() {
        XCTAssertEqual(deck.cards.count, 52)
        XCTAssertEqual(deck.availableCards.count, 52)

        XCTAssertNotNil(deck.next())
        XCTAssertEqual(deck.availableCards.count, 51)

        for _ in 0..<51 {
            XCTAssertNotNil(deck.next())
        }
        XCTAssertNil(deck.next())
        XCTAssertEqual(deck.availableCards.count, 0)
        XCTAssertEqual(deck.cards.count, 52)
    }

    func testDescription() {
        // consistent description is not possible right now without sorting so testing based on char count
        XCTAssertEqual(deck.description.characters.count, 212)
        XCTAssertEqual(deck.debugDescription, deck.description)
    }
}
