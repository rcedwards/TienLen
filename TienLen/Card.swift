//
//  Card.swift
//  TienLen
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

public struct Card {
    let rank: Rank
    let suit: Suit

    public init(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
}

public func ==(lhs: Card, rhs: Card) -> Bool {
    return lhs.rank == rhs.rank && lhs.suit == rhs.suit
}

extension Card: Hashable {
    public var hashValue: Int {
        return rank.hashValue ^ suit.hashValue
    }
}
