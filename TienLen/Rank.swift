//
//  Rank.swift
//  TienLen
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

public enum Rank {
    case Ace
    case King
    case Queen
    case Jack
    case Ten
    case Nine
    case Eight
    case Seven
    case Six
    case Five
    case Four
    case Three
    case Two

    public static let allRanks: [Rank] = [
        .Ace,
        .King,
        .Queen,
        .Jack,
        .Ten,
        .Nine,
        .Eight,
        .Seven,
        .Six,
        .Five,
        .Four,
        .Three,
        .Two
    ]
}

extension Rank: CustomStringConvertible, CustomDebugStringConvertible {
    public var description: String {
        return _description
    }
    public var debugDescription: String {
        return _description
    }
    public var _description: String {
        switch self {
        case .Ace:
            return "A"
        case .King:
            return "K"
        case .Queen:
            return "Q"
        case .Jack:
            return "J"
        case .Ten:
            return "10"
        case .Nine:
            return "9"
        case .Eight:
            return "8"
        case .Seven:
            return "7"
        case .Six:
            return "6"
        case .Five:
            return "5"
        case .Four:
            return "4"
        case .Three:
            return "3"
        case .Two:
            return "2"
        }
    }
}
