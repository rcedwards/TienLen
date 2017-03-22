//
//  InstantWinTests.swift
//  TienLen
//
//  Created by Robert Edwards on 3/5/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import XCTest

import PlayingCards

@testable import TienLen

class InstantWinTests: XCTestCase {

    /*
    Insant Wins

    Four 2s
    Six pairs (In sequence, Ex. 44,55,66,77,88,99)
    Three triples (In sequence, Ex. 444,555,666) (three triples are rarer than six pairs).
    Dragon's Head (Dragon): A special sequence that runs from 3 through ace. A dragon can only be defeated by another dragon of higher suit. A dragon of hearts can't be defeated. This type of sequence is the longest in the game. The dragon is the sequence that has all individual cards, like 3♠ 4♠ 5 ♠ 6♠ 7♠ 8♠ 9♠ 10♠ J♠ Q♠ K♠ A♠ 2♠.

    The last instant win occasion, ultimate dragon, is the most difficult to attain. The ultimate dragon must contain two things in order for the player to receive an automatic victory: the 3♠, and the A♥. These two cards are essential in an ultimate dragon, because the three of spades commences the game, and the player can run the sequence straight to the ace of hearts. This makes the entire dragon completely unstoppable, therefore leaving the player with one remaining card, resulting in a victory.
    */

    func testFourTwosInstantWin() {
        let twoOfHearts = TienLen.Card(rank: .two, suit: .heart)
        let twoOfSpades = TienLen.Card(rank: .two, suit: .spade)
        let twoOfClubs = TienLen.Card(rank: .two, suit: .club)
        let twoOfDiamonds = TienLen.Card(rank: .two, suit: .diamond)

        guard let fourTwos = Hand(cards: [twoOfHearts,
            twoOfSpades,
            twoOfClubs,
            twoOfDiamonds,
            TienLen.Card(rank: .ace, suit: .spade),
            TienLen.Card(rank: .five, suit: .spade),
            TienLen.Card(rank: .nine, suit: .spade),
            TienLen.Card(rank: .jack, suit: .spade),
            TienLen.Card(rank: .three, suit: .spade),
            TienLen.Card(rank: .three, suit: .heart),
            TienLen.Card(rank: .three, suit: .diamond),
            TienLen.Card(rank: .six, suit: .spade),
            TienLen.Card(rank: .jack, suit: .diamond)
            ]) else {
                XCTFail("Failed to create hand")
                return
        }

        XCTAssertTrue(fourTwos.containsInstantWin)
    }

    func testSixPairsInstantWin() {
        guard let sixPairs = Hand(cards: [
            TienLen.Card(rank: .four, suit: .heart),
            TienLen.Card(rank: .four, suit: .spade),
            TienLen.Card(rank: .three, suit: .heart),
            TienLen.Card(rank: .three, suit: .diamond),
            TienLen.Card(rank: .ten, suit: .club),
            TienLen.Card(rank: .ten, suit: .spade),
            TienLen.Card(rank: .king, suit: .diamond),
            TienLen.Card(rank: .king, suit: .club),
            TienLen.Card(rank: .ace, suit: .spade),
            TienLen.Card(rank: .ace, suit: .heart),
            TienLen.Card(rank: .two, suit: .heart),
            TienLen.Card(rank: .two, suit: .diamond),
            TienLen.Card(rank: .two, suit: .spade)
            ]) else {
                XCTFail("Failed to create hand")
                return
        }
        XCTAssertTrue(sixPairs.containsInstantWin)
    }

    func testThreeTriplesInstantWin() {
        guard let threeTriples = Hand(cards: [
            TienLen.Card(rank: .four, suit: .heart),
            TienLen.Card(rank: .four, suit: .spade),
            TienLen.Card(rank: .four, suit: .club),
            TienLen.Card(rank: .ten, suit: .diamond),
            TienLen.Card(rank: .ten, suit: .club),
            TienLen.Card(rank: .ten, suit: .spade),
            TienLen.Card(rank: .king, suit: .diamond),
            TienLen.Card(rank: .king, suit: .club),
            TienLen.Card(rank: .king, suit: .spade),
            TienLen.Card(rank: .ace, suit: .heart),
            TienLen.Card(rank: .three, suit: .heart),
            TienLen.Card(rank: .five, suit: .diamond),
            TienLen.Card(rank: .six, suit: .spade)
            ]) else {
                XCTFail("Failed to create hand")
                return
        }
        XCTAssertTrue(threeTriples.containsInstantWin)
    }

    func testUltimateDragonsHead() {
        guard let ultimateDragon = Hand(cards: [
            TienLen.Card(rank: .three, suit: .spade),
            TienLen.Card(rank: .four, suit: .spade),
            TienLen.Card(rank: .five, suit: .club),
            TienLen.Card(rank: .six, suit: .diamond),
            TienLen.Card(rank: .seven, suit: .club),
            TienLen.Card(rank: .eight, suit: .spade),
            TienLen.Card(rank: .nine, suit: .diamond),
            TienLen.Card(rank: .ten, suit: .club),
            TienLen.Card(rank: .jack, suit: .spade),
            TienLen.Card(rank: .queen, suit: .heart),
            TienLen.Card(rank: .king, suit: .heart),
            TienLen.Card(rank: .ace, suit: .heart),
            TienLen.Card(rank: .two, suit: .spade)
            ]) else {
                XCTFail("Failed to create hand")
                return
        }
        XCTAssertTrue(ultimateDragon.containsInstantWin)
    }
}
