//
//  CardBodyRankViewTests.swift
//  TienLen
//
//  Created by Robert Edwards on 9/19/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import XCTest

@testable import PlayingCards

class CardBodyRankViewTests: XCTestCase {

    func testSuitDetailGridVisibility() {
        for rank in Rank.allRanks {
            let grid = CardBodyRankView.suitVisibilityGrid(for: rank)
            XCTAssertEqual(grid.count, DetailSuitViewGridColumnCount)
            for column in grid {
                XCTAssertEqual(column.count, DetailSuitViewGridRowCount)
            }

            let visibleElements = grid.flatMap() { return $0.filter() { v in return v } }
            XCTAssertEqual(visibleElements.count, CardBodyRankViewTests.expectedVisibleViewCount(for: rank),
                           "Failed for rank: \(rank)")
        }
    }

    static func expectedVisibleViewCount(for rank: Rank) -> Int {
        switch rank {
        case .ace:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case .four:
            return 4
        case .five:
            return 5
        case .six:
            return 6
        case .seven:
            return 7
        case .eight:
            return 8
        case .nine:
            return 9
        case .ten:
            return 10
        case .jack, .queen, .king:
            return 0
        }
    }
    
}
