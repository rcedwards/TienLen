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

    public enum Error: ErrorType {
        case InvalidNumberOfPlayers(Int)
    }
    
    public struct Hand {
        private static let CardsPerHand = 13
        
        let cards: Set<Card>
        
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
    private mutating func dealHands() {
        for _ in 0..<numberOfPlayers {
            playerHands.append(newPlayerHand())
        }
    }
    
    private mutating func newPlayerHand() -> Hand {
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
