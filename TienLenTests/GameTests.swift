//
//  GameTests.swift
//  TienLen
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import XCTest

@testable import TienLen

class GameTests: XCTestCase {
    
    func testValidateCardOrder() {
        let deck = Deck()
        XCTAssertFalse(InvalidGameStub(deck: deck).validateCardOrder())
        XCTAssertTrue(ValidGameStub(deck: deck).validateCardOrder())
    }
    
}

struct ValidGameStub: Game {
    var deck: Deck
    var playerHands = [Hand]()

    init(deck: Deck) {
        self.deck = deck
    }

    static var rankOrder: Array<Rank> = [
        .Ace, .Two, .Jack, .Queen, .Four, .Nine,
        .King, .Five, .Eight, .Three, .Five, .Six, .Seven
    ]
    static var suitOrder: Array<Suit> = [
        .Heart,
        .Spade,
        .Diamond,
        .Club
    ]
}

struct InvalidGameStub: Game {
    var deck: Deck
    var playerHands = [Hand]()

    init(deck: Deck) {
        self.deck = deck
    }

    static var rankOrder: Array<Rank> = [
        .Ace,
        .Two
    ]
    static var suitOrder: Array<Suit> = [
        .Heart
    ]
}
