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
        let twoOfHearts = TienLen.Card(rank: .Two, suit: .Heart)
        let twoOfSpades = TienLen.Card(rank: .Two, suit: .Spade)
        let twoOfClub = TienLen.Card(rank: .Two, suit: .Club)
        let twoOfDiamonds = TienLen.Card(rank: .Two, suit: .Diamond)

        let aceOfDiamonds = TienLen.Card(rank: .Ace, suit: .Diamond)

        XCTAssertGreaterThan(twoOfDiamonds, twoOfClub)
        XCTAssertGreaterThan(twoOfHearts, twoOfDiamonds)
        XCTAssertGreaterThan(twoOfClub, twoOfSpades)

        XCTAssertGreaterThan(twoOfSpades, aceOfDiamonds)
    }
}
