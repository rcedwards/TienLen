//
//  Game.swift
//  TienLen
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

public typealias Hand = Set<Card>

public protocol Game {
    var deck: Deck { get }
    var playerHands: [Hand] { get }

    static var rankOrder: Array<Rank> { get }
    static var suitOrder: Array<Suit> { get }
}

public extension Game {
    public static func validateCardOrder() -> Bool {
        let ranks = rankOrder
        let suits = suitOrder
        let suitSet = Set(suits)
        let rankSet = Set(ranks)

        let exclusiveCount = rankSet.count * suitSet.count
        let orderCount = ranks.count * suits.count

        let expectedCount = Rank.allRanks.count * Suit.allSuits.count

        return (orderCount == expectedCount && exclusiveCount == expectedCount)
    }
}
