//
//  GameTests.swift
//  TienLen
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import XCTest

@testable import PlayingCards

class GameTests: XCTestCase {
    
    func testValidateCardOrder() {
        let deck = Deck()
        XCTAssertFalse(IncompleteGameStub(deck: deck).validateCardOrder())
        XCTAssertFalse(DuplicateRanksGameStub(deck: deck).validateCardOrder())
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
        .Ace,
        .Two,
        .Jack,
        .Queen,
        .Four,
        .Nine,
        .King,
        .Ten,
        .Eight,
        .Three,
        .Five,
        .Six,
        .Seven
    ]
    static var suitOrder: Array<Suit> = [
        .Heart,
        .Spade,
        .Diamond,
        .Club
    ]
}

struct DuplicateRanksGameStub: Game {
    var deck: Deck
    var playerHands = [Hand]()

    init(deck: Deck) {
        self.deck = deck
    }

    static var rankOrder: Array<Rank> = [
        .Ace,
        .Two,
        .Jack,
        .Queen,
        .Four,
        .Nine,
        .King,
        .Five,
        .Eight,
        .Three,
        .Five,
        .Six,
        .Seven
    ]
    static var suitOrder: Array<Suit> = [
        .Heart,
        .Spade,
        .Diamond,
        .Club
    ]
}

struct IncompleteGameStub: Game {
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
