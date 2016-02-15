//
//  Hands.swift
//  TienLen
//
//  Created by Robert Edwards on 2/14/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import PlayingCards

private typealias Combo = Set<Card>

extension SequenceType where Generator.Element == Card {

    // MARK: - Instant Wins

    /*
    Four 2s
    Six pairs (In sequence, Ex. 44,55,66,77,88,99)
    Three triples (In sequence, Ex. 444,555,666) (three triples are rarer than six pairs).

    Dragon's Head (Dragon): A special sequence that runs from 3 through ace. A dragon can only be defeated by another dragon of higher suit. A dragon of hearts can't be defeated. This type of sequence is the longest in the game. The dragon is the sequence that has all individual cards, like 3♠ 4♠ 5 ♠ 6♠ 7♠ 8♠ 9♠ 10♠ J♠ Q♠ K♠ A♠ 2♠.

    The last instant win occasion, ultimate dragon, is the most difficult to attain. The ultimate dragon must contain two things in order for the player to receive an automatic victory: the 3♠, and the A♥. These two cards are essential in an ultimate dragon, because the three of spades commences the game, and the player can run the sequence straight to the ace of hearts. This makes the entire dragon completely unstoppable, therefore leaving the player with one remaining card, resulting in a victory.
    */

    public var containsInstantWin: Bool {
        return (
            containsFourTwos() ||
            containsSixPairs()
        )
    }

    private func containsFourTwos() -> Bool {
        return filter() { $0.rank == .Two }.count == 4
    }

    private func containsSixPairs() -> Bool {
        return pairs().count == 6
    }

    private func pairs() -> Set<Combo> {
        var pairs = Set<Combo>()
        for card in self {
            let matches = filter() { $0.rank == card.rank }
            if matches.count > 0 {
                let newCombo = matches.reduce(Combo([card])) { $0.union(CollectionOfOne($1)) }
                pairs.insert(newCombo)
            }
        }
        return pairs
    }
}
