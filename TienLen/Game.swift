//
//  Game.swift
//  TienLen
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

public typealias Hand = Set<Card>

public protocol Game {
    var deck: Deck { get }
    var hands: [Hand] { get }

    static var rankOrder: Array<Rank> { get }
    static var suitOrder: Array<Suit> { get }
}

public extension Game {
    public func validateCardOrder() -> Bool {
        let orderCount = (self.dynamicType.rankOrder.count * self.dynamicType.suitOrder.count)
        return (orderCount == deck.cards.count)
    }
}
