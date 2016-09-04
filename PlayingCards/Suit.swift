//
//  Suit.swift
//  PlayingCards
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

public enum Suit {
    case club
    case heart
    case spade
    case diamond

    public static let allSuits: [Suit] = [
        .club,
        .heart,
        .spade,
        .diamond
    ]
}

extension Suit: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return _description
    }
    public var debugDescription: String {
        return _description
    }
    public var _description: String {
        switch self {
        case .club:
            return "♣"
        case .diamond:
            return "♦"
        case .heart:
            return "♥"
        case .spade:
            return "♠"
        }
    }
}
