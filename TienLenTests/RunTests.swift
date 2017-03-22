//
//  RunTests.swift
//  TienLen
//
//  Created by Robert Edwards on 3/22/17.
//  Copyright © 2017 Panko. All rights reserved.
//

import XCTest

import PlayingCards
@testable import TienLen

class RunTests: XCTestCase {

    func testRunComparisonWithSuitDifferenceOnly() {
        let run1: Run = [
            TienLen.Card(rank: .ace, suit: .heart),
            TienLen.Card(rank: .king, suit: .heart),
            TienLen.Card(rank: .queen, suit: .spade)
        ]

        let run2: Run = [
            TienLen.Card(rank: .ace, suit: .spade),
            TienLen.Card(rank: .king, suit: .heart),
            TienLen.Card(rank: .queen, suit: .spade)
        ]

        XCTAssertGreaterThan(run1, run2)
    }

    func testRunComparisonWithRankAndSuitDifference() {
        let run1: Run = [
            TienLen.Card(rank: .two, suit: .heart),
            TienLen.Card(rank: .ace, suit: .heart),
            TienLen.Card(rank: .king, suit: .spade)
        ]

        let run2: Run = [
            TienLen.Card(rank: .ace, suit: .spade),
            TienLen.Card(rank: .king, suit: .heart),
            TienLen.Card(rank: .queen, suit: .spade)
        ]

        XCTAssertGreaterThan(run1, run2)
    }

    func testRunEquality() {
        let run1: Run = [
            TienLen.Card(rank: .ace, suit: .spade),
            TienLen.Card(rank: .king, suit: .heart),
            TienLen.Card(rank: .queen, suit: .spade)
        ]
        let run2: Run = [
            TienLen.Card(rank: .ace, suit: .spade),
            TienLen.Card(rank: .king, suit: .heart),
            TienLen.Card(rank: .queen, suit: .spade)
        ]
        XCTAssertEqual(run1, run2)
    }
    
}
