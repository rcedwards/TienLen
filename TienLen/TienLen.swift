//
//  TienLen.swift
//  TienLen
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

public typealias TienLenCard = Card
public struct TienLen: Game {

    // MARK: - Member Variables

    public let deck: Deck
    public var hands = [Hand]()

    // MARK: - Static Properties

    public static var suitOrder: Array<Suit> {
        return [
            .Spade,
            .Club,
            .Diamond,
            .Heart
        ]
    }

    public static var rankOrder: Array<Rank> {
        return [
            .Three,
            .Four,
            .Five,
            .Six,
            .Seven,
            .Eight,
            .Nine,
            .Ten,
            .Jack,
            .Queen,
            .King,
            .Ace,
            .Two
        ]
    }

    // MARK: - Lifecycle

    public init(deck: Deck) {
        self.deck = deck
    }
}

extension TienLenCard: Comparable { }
public func <(lhs: TienLenCard, rhs: TienLenCard) -> Bool {
    let rankOrder = TienLen.rankOrder
    let suitOrder = TienLen.suitOrder

    guard
        let lhsRankIndex = rankOrder.indexOf(lhs.rank),
        let rhsRankIndex = rankOrder.indexOf(rhs.rank),
        let lhsSuitIndex = suitOrder.indexOf(lhs.suit),
        let rhsSuitIndex = suitOrder.indexOf(rhs.suit) else {
            fatalError("Rank order and suit order should contain all possible types.")
    }

    if lhs.rank != rhs.rank {
        return lhsRankIndex < rhsRankIndex
    } else {
        return lhsSuitIndex < rhsSuitIndex
    }
}
