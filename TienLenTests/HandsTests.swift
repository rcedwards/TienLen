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
        let hand = TienLen.Hand([
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
            ])
        XCTAssertEqual(hand.count, 13)

        XCTAssertEqual(hand.runs().count, 2)

        let longestRun = hand.longestRun()
        XCTAssertNotNil(longestRun)
        let longestRunCount = longestRun?.count ?? 0
        XCTAssertEqual(longestRunCount, 5)
    }
}
