//
//  Deck.swift
//  PlayingCards
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

public struct Deck {
    public fileprivate(set) var cards: Set<Card>
    public var availableCards: Set<Card> {
        return cards.subtracting(consumedCards)
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
        if let card = availableCards.randomElement() {
            consumedCards.insert(card)
            return card
        }
        return nil
    }
}

private extension Set {
    func randomElement() -> Element? {
        let random = Int(arc4random_uniform(UInt32(count)))
        let array = Array(self)
        guard array.indices.contains(random) else {
            return nil
        }
        return array[random]
    }
}

extension Deck: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return _description
    }
    public var debugDescription: String {
        return _description
    }
    public var _description: String {
        return cards.reduce("") { $0 + "\($1.description) " }
    }
}
