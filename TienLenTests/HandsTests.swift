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
            TienLen.Card(rank: .three, suit: .heart),
            TienLen.Card(rank: .four, suit: .heart),
            TienLen.Card(rank: .five, suit: .heart),
            TienLen.Card(rank: .ten, suit: .diamond),
            TienLen.Card(rank: .jack, suit: .heart),
            TienLen.Card(rank: .queen, suit: .diamond),
            TienLen.Card(rank: .king, suit: .club),
            TienLen.Card(rank: .ace, suit: .spade),
            TienLen.Card(rank: .ten, suit: .heart),
            TienLen.Card(rank: .three, suit: .club),
            TienLen.Card(rank: .three, suit: .diamond),
            TienLen.Card(rank: .four, suit: .club),
            TienLen.Card(rank: .jack, suit: .diamond)
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
        let hand = TienLen.Hand(cards: [TienLen.Card(rank: .ten, suit: .heart)])
        XCTAssertNil(hand, "Hand should not be created with less than 13 cards")
    }

    func testMaximumCardCount() {
        let hand = TienLen.Hand(cards: [
            TienLen.Card(rank: .three, suit: .heart),
            TienLen.Card(rank: .four, suit: .heart),
            TienLen.Card(rank: .five, suit: .heart),
            TienLen.Card(rank: .ten, suit: .diamond),
            TienLen.Card(rank: .jack, suit: .heart),
            TienLen.Card(rank: .queen, suit: .diamond),
            TienLen.Card(rank: .king, suit: .club),
            TienLen.Card(rank: .ace, suit: .spade),
            TienLen.Card(rank: .ten, suit: .heart),
            TienLen.Card(rank: .three, suit: .club),
            TienLen.Card(rank: .three, suit: .diamond),
            TienLen.Card(rank: .four, suit: .club),
            TienLen.Card(rank: .jack, suit: .diamond),
            TienLen.Card(rank: .jack, suit: .club)
            ])
        XCTAssertNil(hand, "Hand should not be created with any more than 13 cards.")
    }
}
