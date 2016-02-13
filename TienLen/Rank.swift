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
