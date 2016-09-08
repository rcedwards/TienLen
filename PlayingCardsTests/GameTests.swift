//
//  GameTests.swift
//  PlayingCards
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import XCTest

@testable import PlayingCards

class GameTests: XCTestCase {
    
    func testValidateCardOrder() {
        XCTAssertFalse(IncompleteGameStub.validateCardOrder())
        XCTAssertFalse(DuplicateRanksGameStub.validateCardOrder())
        XCTAssertTrue(ValidGameStub.validateCardOrder())
    }
    
}

struct ValidGameStub: Game {
    var deck: Deck

    init(deck: Deck) {
        self.deck = deck
    }

    static var rankOrder: Array<Rank> = [
        .ace,
        .two,
        .jack,
        .queen,
        .four,
        .nine,
        .king,
        .ten,
        .eight,
        .three,
        .five,
        .six,
        .seven
    ]
    static var suitOrder: Array<Suit> = [
        .heart,
        .spade,
        .diamond,
        .club
    ]
}

struct DuplicateRanksGameStub: Game {
    var deck: Deck

    init(deck: Deck) {
        self.deck = deck
    }

    static var rankOrder: Array<Rank> = [
        .ace,
        .two,
        .jack,
        .queen,
        .four,
        .nine,
        .king,
        .five,
        .eight,
        .three,
        .five,
        .six,
        .seven
    ]
    static var suitOrder: Array<Suit> = [
        .heart,
        .spade,
        .diamond,
        .club
    ]
}

struct IncompleteGameStub: Game {
    var deck: Deck

    init(deck: Deck) {
        self.deck = deck
    }

    static var rankOrder: Array<Rank> = [
        .ace,
        .two
    ]
    static var suitOrder: Array<Suit> = [
        .heart
    ]
}
