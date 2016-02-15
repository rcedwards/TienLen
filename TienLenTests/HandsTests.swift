//
//  HandsTests.swift
//  TienLen
//
//  Created by Robert Edwards on 2/14/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import XCTest

@testable import TienLen

class HandsTests: XCTestCase {

    func testInstantWins() {
        let twoOfHearts = TienLen.Card(rank: .Two, suit: .Heart)
        let twoOfSpades = TienLen.Card(rank: .Two, suit: .Spade)
        let twoOfClubs = TienLen.Card(rank: .Two, suit: .Club)
        let twoOfDiamonds = TienLen.Card(rank: .Two, suit: .Diamond)
        let fourTwos = TienLen.Hand([twoOfHearts, twoOfSpades, twoOfClubs, twoOfDiamonds])
        XCTAssertTrue(fourTwos.containsInstantWin)

        let sixPairs = TienLen.Hand([
            TienLen.Card(rank: .Four, suit: .Heart),
            TienLen.Card(rank: .Four, suit: .Spade),
            TienLen.Card(rank: .Three, suit: .Heart),
            TienLen.Card(rank: .Three, suit: .Diamond),
            TienLen.Card(rank: .Ten, suit: .Club),
            TienLen.Card(rank: .Ten, suit: .Spade),
            TienLen.Card(rank: .King, suit: .Diamond),
            TienLen.Card(rank: .King, suit: .Club),
            TienLen.Card(rank: .Ace, suit: .Spade),
            TienLen.Card(rank: .Ace, suit: .Heart),
            TienLen.Card(rank: .Two, suit: .Heart),
            TienLen.Card(rank: .Two, suit: .Diamond),
            TienLen.Card(rank: .Two, suit: .Spade)
        ])
        XCTAssertTrue(sixPairs.containsInstantWin)
    }

}