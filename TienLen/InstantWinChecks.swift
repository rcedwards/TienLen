//
//  InstantWinChecks.swift
//  TienLen
//
//  Created by Robert Edwards on 3/5/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import Foundation

import PlayingCards

extension Hand {
    public var containsInstantWin: Bool { return cards.containsInstantWin }
}

extension Sequence where Iterator.Element == TienLen.Card {

    // MARK: - Instant Wins

    public var containsInstantWin: Bool {
        return (
            containsFourTwos() ||
                containsSixPairs() ||
                containsThreeTriples() ||
                containsDragonHead() ||
                containsUltimateDragon()
        )
    }

    private func containsFourTwos() -> Bool {
        return filter() { $0.rank == .two }.count == 4
    }

    private func containsSixPairs() -> Bool {
        return combos.count == 6
    }

    private func containsThreeTriples() -> Bool {
        return combos.filter() { $0.count >= 3 }.count >= 3
    }

    private func containsUltimateDragon() -> Bool {
        guard var run = longestRun else {
            return false
        }
        let threeOfSpades = TienLen.Card(rank: .three, suit: .spade)
        let aceOfHearts = TienLen.Card(rank: .ace, suit: .heart)
        guard let threeIndex = run.index(of: threeOfSpades), run.contains(aceOfHearts) else {
            return false
        }
        run.remove(at: threeIndex)
        guard let remainingRun = run.longestRun, remainingRun.count >= 11 else { return false }
        return true
    }

    private func containsDragonHead() -> Bool {
        return longestRun?.count == 13
    }
}
