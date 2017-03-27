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
        guard let run = longestRun else {
            return false
        }
        let threeOfSpades = TienLen.Card(rank: .three, suit: .spade)
        let aceOfHearts = TienLen.Card(rank: .ace, suit: .heart)
        return run.count == 12 && (run.contains(threeOfSpades) && run.contains(aceOfHearts))
    }

    private func containsDragonHead() -> Bool {
        return longestRun?.count == 13
    }
}
