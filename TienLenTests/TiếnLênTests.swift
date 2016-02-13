//
//  TiếnLênTests.swift
//  TienLen
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import XCTest

@testable import TienLen

class TiếnLênTests: XCTestCase {
    
    var currentGame: TiếnLên!
    let deck = Deck()

    override func setUp() {
        currentGame = TiếnLên(deck: deck)
    }

    func testInitialization() {
        XCTAssertNotNil(currentGame)
    }

    func testSuitOrder() {
        let twoOfHearts = TiếnLênCard(rank: .Two, suit: .Heart)
        let twoOfSpades = TiếnLênCard(rank: .Two, suit: .Spade)
        let twoOfClub = TiếnLênCard(rank: .Two, suit: .Club)
        let twoOfDiamonds = TiếnLênCard(rank: .Two, suit: .Diamond)

        let aceOfDiamonds = TiếnLênCard(rank: .Ace, suit: .Diamond)

        XCTAssertGreaterThan(twoOfDiamonds, twoOfClub)
        XCTAssertGreaterThan(twoOfHearts, twoOfDiamonds)
        XCTAssertGreaterThan(twoOfClub, twoOfSpades)

        XCTAssertGreaterThan(twoOfSpades, aceOfDiamonds)
    }
}
