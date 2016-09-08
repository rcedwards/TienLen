//
//  TienLenTests.swift
//  TienLen
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import XCTest

import PlayingCards

@testable import TienLen

class TienLenTests: XCTestCase {

    let deck = Deck()

    func testNumberOfPlayers() {
        do {
            let _ = try TienLen(numberOfPlayers: 2)
            let _ = try TienLen(numberOfPlayers: 3)
            let _ = try TienLen(numberOfPlayers: 4)
        } catch {
            XCTFail("Unexpected error in test: \(error)")
        }

        do {
            let _ = try TienLen(numberOfPlayers: 0)
            XCTFail("0 is not a valid number of players")
        } catch {}
        do {
            let _ = try TienLen(numberOfPlayers: 1)
            XCTFail("1 is not a valid number of players")
        } catch {}
        do {
            let _ = try TienLen(numberOfPlayers: 5)
            XCTFail("5 is not a valid number of players")
        } catch {}
    }

    func testDealingHands() {
        do {
            let game = try TienLen(numberOfPlayers: 4)
            XCTAssertEqual(game.playerHands.count, 4)
        } catch {
            XCTFail("Unexpected error in test: \(error)")
        }
    }

    func testSuitOrder() {
        XCTAssertTrue(TienLen.validateCardOrder())
        let twoOfHearts = TienLen.Card(rank: .two, suit: .heart)
        let twoOfSpades = TienLen.Card(rank: .two, suit: .spade)
        let twoOfClub = TienLen.Card(rank: .two, suit: .club)
        let twoOfDiamonds = TienLen.Card(rank: .two, suit: .diamond)

        let aceOfDiamonds = TienLen.Card(rank: .ace, suit: .diamond)

        XCTAssertGreaterThan(twoOfDiamonds, twoOfClub)
        XCTAssertGreaterThan(twoOfHearts, twoOfDiamonds)
        XCTAssertGreaterThan(twoOfClub, twoOfSpades)

        XCTAssertGreaterThan(twoOfSpades, aceOfDiamonds)
    }
}
