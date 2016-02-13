//
//  Deck.swift
//  TienLen
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

public struct Deck {
    public let cards: Set<Card>

    public init() {
        var cardSet = Set<Card>()
        for suit in Suit.allSuits {
            for rank in Rank.allRanks {
                cardSet.insert(Card(rank: rank, suit: suit))
            }
        }
        cards = cardSet
    }
}
