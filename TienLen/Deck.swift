//
//  Deck.swift
//  TienLen
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

public struct Deck {
    public private(set) var cards: Set<Card>
    public var availableCards: Set<Card> {
        return cards.subtract(consumedCards)
    }
    private var consumedCards = Set<Card>()

    // MARK: - Lifecycle

    public init() {
        var cardSet = Set<Card>()
        for suit in Suit.allSuits {
            for rank in Rank.allRanks {
                cardSet.insert(Card(rank: rank, suit: suit))
            }
        }
        cards = cardSet
    }

    public mutating func next() -> Card? {
        if let card = availableCards.first {
            consumedCards.insert(card)
            return card
        }
        return nil
    }
}
}
