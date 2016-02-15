//
//  Suit.swift
//  PlayingCards
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

public enum Suit {
    case Club
    case Heart
    case Spade
    case Diamond

    public static let allSuits: [Suit] = [
        .Club,
        .Heart,
        .Spade,
        .Diamond
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
        case .Club:
            return "♣"
        case .Diamond:
            return "♦"
        case .Heart:
            return "♥"
        case .Spade:
            return "♠"
        }
    }
}
