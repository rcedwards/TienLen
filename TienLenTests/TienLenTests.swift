//
//  TienLenTests.swift
//  TienLen
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import XCTest

@testable import TienLen

class TienLenTests: XCTestCase {
    
    var currentGame: TienLen!
    let deck = Deck()

    override func setUp() {
        currentGame = TienLen(deck: deck)
    }

    func testInitialization() {
        XCTAssertNotNil(currentGame)
    }

    func testSuitOrder() {
        let twoOfHearts = TienLenCard(rank: .Two, suit: .Heart)
        let twoOfSpades = TienLenCard(rank: .Two, suit: .Spade)
        let twoOfClub = TienLenCard(rank: .Two, suit: .Club)
        let twoOfDiamonds = TienLenCard(rank: .Two, suit: .Diamond)

        let aceOfDiamonds = TienLenCard(rank: .Ace, suit: .Diamond)

        XCTAssertGreaterThan(twoOfDiamonds, twoOfClub)
        XCTAssertGreaterThan(twoOfHearts, twoOfDiamonds)
        XCTAssertGreaterThan(twoOfClub, twoOfSpades)

        XCTAssertGreaterThan(twoOfSpades, aceOfDiamonds)
    }
}
