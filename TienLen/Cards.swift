//
//  Cards.swift
//  TienLen
//
//  Created by Robert Edwards on 3/27/16.
//  Copyright © 2016 Panko. All rights reserved.
//

// MARK: - Card Order

extension TienLen.Card: Comparable { }
public func <(lhs: TienLen.Card, rhs: TienLen.Card) -> Bool {
    let rankOrder = TienLen.rankOrder
    let suitOrder = TienLen.suitOrder

    guard
        let lhsRankIndex = rankOrder.firstIndex(of: lhs.rank),
        let rhsRankIndex = rankOrder.firstIndex(of: rhs.rank),
        let lhsSuitIndex = suitOrder.firstIndex(of: lhs.suit),
        let rhsSuitIndex = suitOrder.firstIndex(of: rhs.suit) else {
            fatalError("Rank order and suit order should contain all possible types.")
    }

    if lhs.rank != rhs.rank {
        return lhsRankIndex < rhsRankIndex
    } else {
        return lhsSuitIndex < rhsSuitIndex
    }
}
