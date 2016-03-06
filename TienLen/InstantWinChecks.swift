//
//  InstantWinChecks.swift
//  TienLen
//
//  Created by Robert Edwards on 3/5/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import Foundation

import PlayingCards

extension SequenceType where Generator.Element == TienLen.Card {

    // MARK: - Instant Wins

    public var containsInstantWin: Bool {
        return (
            containsFourTwos() ||
                containsSixPairs() ||
                containsThreeTriples() ||
                containsUltimateDragonHead()
        )
    }

    private func containsFourTwos() -> Bool {
        return filter() { $0.rank == .Two }.count == 4
    }

    private func containsSixPairs() -> Bool {
        return combos().count == 6
    }

    private func containsThreeTriples() -> Bool {
        return combos().filter() { $0.count >= 3 }.count >= 3
    }

    private func containsUltimateDragonHead() -> Bool {
        guard let run = longestRun() else {
            return false
        }
        let threeOfSpades = TienLen.Card(rank: .Three, suit: .Spade)
        let aceOfHearts = TienLen.Card(rank: .Ace, suit: .Heart)
        return run.count == 13 && (run.contains(threeOfSpades) && run.contains(aceOfHearts))
    }

    private func containsDragonHead() -> Bool {
        return longestRun()?.count == 13
    }
}