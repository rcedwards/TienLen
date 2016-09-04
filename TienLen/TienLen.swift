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

    // MARK: - Member Variables

    public var deck: Deck
    public var activeHand: Hand?
    public fileprivate(set) var playerHands = [Hand]()

    fileprivate let numberOfPlayers: Int

    // MARK: - Static Properties

    public static var suitOrder: Array<Suit> {
        return [
            .spade,
            .club,
            .diamond,
            .heart
        ]
    }

    public static var rankOrder: Array<Rank> {
        return [
            .three,
            .four,
            .five,
            .six,
            .seven,
            .eight,
            .nine,
            .ten,
            .jack,
            .queen,
            .king,
            .ace,
            .two
        ]
    }

    private static let acceptablePlayerRange = 2...4

    // MARK: - Lifecycle

    public init(numberOfPlayers: Int, deck: Deck = Deck()) throws {
        guard TienLen.acceptablePlayerRange.contains(numberOfPlayers) else {
            throw Error.invalidNumberOfPlayers(numberOfPlayers)
        }
        self.numberOfPlayers = numberOfPlayers
        self.deck = deck
        dealHands()
    }

    public enum Error: Swift.Error {
        case invalidNumberOfPlayers(Int)
    }

    public struct Hand {
        fileprivate static let CardsPerHand = 13

        public let cards: Set<Card>

        public init?(cards: Set<Card>) {
            guard cards.count == Hand.CardsPerHand else {
                return nil
            }

            self.cards = cards
        }
    }
}

// MARK: - Dealing

extension TienLen {
    fileprivate mutating func dealHands() {
        for _ in 0..<numberOfPlayers {
            playerHands.append(newPlayerHand())
        }
    }

    fileprivate mutating func newPlayerHand() -> Hand {
        var cards = Set<Card>()
        for _ in 0..<TienLen.Hand.CardsPerHand {
            guard let nextCard = deck.next() else {
                fatalError("Should never run out of cards while dealing")
            }
            cards.insert(nextCard)
        }
        guard let hand = Hand(cards: cards) else {
            fatalError("Failed to create player hand")
        }
        return hand
    }
}
