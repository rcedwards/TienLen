//
//  TienLen.swift
//  TienLen
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import PlayingCards

public struct TienLen: Game {

    public typealias Card = PlayingCards.Card
    public typealias Hand = Set<Card>

    // MARK: - Member Variables

    public var deck: Deck
    public var activeHand: Hand?
    public private(set) var playerHands = [Hand]()

    private let numberOfPlayers: Int

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

    private static let cardsPerPlayer = 13
    private static let acceptablePlayerRange = 2...4

    // MARK: - Lifecycle

    public init(numberOfPlayers: Int, deck: Deck = Deck()) throws {
        guard TienLen.acceptablePlayerRange.contains(numberOfPlayers) else {
            throw Error.InvalidNumberOfPlayers(numberOfPlayers)
        }
        self.numberOfPlayers = numberOfPlayers
        self.deck = deck
        dealHands()
    }

    private mutating func dealHands() {
        for _ in 0..<numberOfPlayers {
            playerHands.append(newPlayerHand())
        }
    }

    private mutating func newPlayerHand() -> Hand {
        var playerHand = Hand()
        for _ in 0..<TienLen.cardsPerPlayer {
            guard let nextCard = deck.next() else {
                fatalError("Should never run out of cards while dealing")
            }
            playerHand.insert(nextCard)
        }
        return playerHand
    }

    public enum Error: ErrorType {
        case InvalidNumberOfPlayers(Int)
    }
}

// MARK: - Card Order

extension Card: Comparable { }
public func <(lhs: Card, rhs: Card) -> Bool {
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
