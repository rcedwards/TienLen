//
//  Hands.swift
//  TienLen
//
//  Created by Robert Edwards on 2/14/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import PlayingCards

// MARK: - Instant Wins

extension Set where Element: CardType {
    public var containsInstantWin: Bool {
        return containsFourTwos()
    }

    private func containsFourTwos() -> Bool {
        return filter() { $0.rank == .Two }.count == 4
    }
}
