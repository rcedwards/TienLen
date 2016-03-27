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
        let twoOfHearts = TienLen.Card(rank: .Two, suit: .Heart)
        let twoOfSpades = TienLen.Card(rank: .Two, suit: .Spade)
        let twoOfClubs = TienLen.Card(rank: .Two, suit: .Club)
        let twoOfDiamonds = TienLen.Card(rank: .Two, suit: .Diamond)
        
        guard let fourTwos = TienLen.Hand(cards: [twoOfHearts,
            twoOfSpades,
            twoOfClubs,
            twoOfDiamonds,
            TienLen.Card(rank: .Ace, suit: .Spade),
            TienLen.Card(rank: .Five, suit: .Spade),
            TienLen.Card(rank: .Nine, suit: .Spade),
            TienLen.Card(rank: .Jack, suit: .Spade),
            TienLen.Card(rank: .Three, suit: .Spade),
            TienLen.Card(rank: .Three, suit: .Heart),
            TienLen.Card(rank: .Three, suit: .Diamond),
            TienLen.Card(rank: .Six, suit: .Spade),
            TienLen.Card(rank: .Jack, suit: .Diamond)
            ]) else {
                XCTFail("Failed to create hand")
                return
        }
        
        XCTAssertTrue(fourTwos.containsInstantWin)
    }
    
    func testSixPairsInstantWin() {
        guard let sixPairs = TienLen.Hand(cards: [
            TienLen.Card(rank: .Four, suit: .Heart),
            TienLen.Card(rank: .Four, suit: .Spade),
            TienLen.Card(rank: .Three, suit: .Heart),
            TienLen.Card(rank: .Three, suit: .Diamond),
            TienLen.Card(rank: .Ten, suit: .Club),
            TienLen.Card(rank: .Ten, suit: .Spade),
            TienLen.Card(rank: .King, suit: .Diamond),
            TienLen.Card(rank: .King, suit: .Club),
            TienLen.Card(rank: .Ace, suit: .Spade),
            TienLen.Card(rank: .Ace, suit: .Heart),
            TienLen.Card(rank: .Two, suit: .Heart),
            TienLen.Card(rank: .Two, suit: .Diamond),
            TienLen.Card(rank: .Two, suit: .Spade)
            ]) else {
                XCTFail("Failed to create hand")
                return
        }
        XCTAssertTrue(sixPairs.containsInstantWin)
    }
    
    func testThreeTriplesInstantWin() {
        guard let threeTriples = TienLen.Hand(cards: [
            TienLen.Card(rank: .Four, suit: .Heart),
            TienLen.Card(rank: .Four, suit: .Spade),
            TienLen.Card(rank: .Four, suit: .Club),
            TienLen.Card(rank: .Ten, suit: .Diamond),
            TienLen.Card(rank: .Ten, suit: .Club),
            TienLen.Card(rank: .Ten, suit: .Spade),
            TienLen.Card(rank: .King, suit: .Diamond),
            TienLen.Card(rank: .King, suit: .Club),
            TienLen.Card(rank: .King, suit: .Spade),
            TienLen.Card(rank: .Ace, suit: .Heart),
            TienLen.Card(rank: .Three, suit: .Heart),
            TienLen.Card(rank: .Five, suit: .Diamond),
            TienLen.Card(rank: .Six, suit: .Spade)
            ]) else {
                XCTFail("Failed to create hand")
                return
        }
        XCTAssertTrue(threeTriples.containsInstantWin)
    }
    
    func testUltimateDragonsHead() {
        guard let ultimateDragon = TienLen.Hand(cards: [
            TienLen.Card(rank: .Three, suit: .Spade),
            TienLen.Card(rank: .Four, suit: .Spade),
            TienLen.Card(rank: .Five, suit: .Club),
            TienLen.Card(rank: .Six, suit: .Diamond),
            TienLen.Card(rank: .Seven, suit: .Club),
            TienLen.Card(rank: .Eight, suit: .Spade),
            TienLen.Card(rank: .Nine, suit: .Diamond),
            TienLen.Card(rank: .Ten, suit: .Club),
            TienLen.Card(rank: .Jack, suit: .Spade),
            TienLen.Card(rank: .Queen, suit: .Heart),
            TienLen.Card(rank: .King, suit: .Heart),
            TienLen.Card(rank: .Ace, suit: .Heart),
            TienLen.Card(rank: .Two, suit: .Spade)
            ]) else {
                XCTFail("Failed to create hand")
                return
        }
        XCTAssertTrue(ultimateDragon.containsInstantWin)
    }
}
