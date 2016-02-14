//
//  LibraryIntegrationTests.swift
//  TienLen
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import XCTest

import TienLen
import PlayingCards

class LibraryIntegrationTests: XCTestCase {

    func testUsingPlayingCardsObjects() {
        let deck = Deck()
        let card = deck.cards.first
        let rank = card?.rank
        let suit = card?.suit

        XCTAssertNotNil(card)
        XCTAssertNotNil(rank)
        XCTAssertNotNil(suit)
    }

    func testUsingTienLenObjects() {
        do {
            let _ = try TienLen(numberOfPlayers: 4)
        } catch {
            XCTFail("Unexpected error in test: \(error)")
        }
    }

}
