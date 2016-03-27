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
    func testRuns() {
        guard let hand = TienLen.Hand(cards: [
            TienLen.Card(rank: .Three, suit: .Heart),
            TienLen.Card(rank: .Four, suit: .Heart),
            TienLen.Card(rank: .Five, suit: .Heart),
            TienLen.Card(rank: .Ten, suit: .Diamond),
            TienLen.Card(rank: .Jack, suit: .Heart),
            TienLen.Card(rank: .Queen, suit: .Diamond),
            TienLen.Card(rank: .King, suit: .Club),
            TienLen.Card(rank: .Ace, suit: .Spade),
            TienLen.Card(rank: .Ten, suit: .Heart),
            TienLen.Card(rank: .Three, suit: .Club),
            TienLen.Card(rank: .Three, suit: .Diamond),
            TienLen.Card(rank: .Four, suit: .Club),
            TienLen.Card(rank: .Jack, suit: .Diamond)
            ]) else {
                XCTFail("Failed to create hand")
                return
        }

        XCTAssertEqual(hand.runs.count, 2)

        let longestRun = hand.longestRun
        XCTAssertNotNil(longestRun)
        let longestRunCount = longestRun?.count ?? 0
        XCTAssertEqual(longestRunCount, 5)
    }

    func testMinimumCardCount() {
        let hand = TienLen.Hand(cards: [TienLen.Card(rank: .Ten, suit: .Heart)])
        XCTAssertNil(hand, "Hand should not be created with less than 13 cards")
    }

    func testMaximumCardCount() {
        let hand = TienLen.Hand(cards: [
            TienLen.Card(rank: .Three, suit: .Heart),
            TienLen.Card(rank: .Four, suit: .Heart),
            TienLen.Card(rank: .Five, suit: .Heart),
            TienLen.Card(rank: .Ten, suit: .Diamond),
            TienLen.Card(rank: .Jack, suit: .Heart),
            TienLen.Card(rank: .Queen, suit: .Diamond),
            TienLen.Card(rank: .King, suit: .Club),
            TienLen.Card(rank: .Ace, suit: .Spade),
            TienLen.Card(rank: .Ten, suit: .Heart),
            TienLen.Card(rank: .Three, suit: .Club),
            TienLen.Card(rank: .Three, suit: .Diamond),
            TienLen.Card(rank: .Four, suit: .Club),
            TienLen.Card(rank: .Jack, suit: .Diamond),
            TienLen.Card(rank: .Jack, suit: .Club)
            ])
        XCTAssertNil(hand, "Hand should not be created with any more than 13 cards.")
    }
}
