//
//  DeckTests.swift
//  TienLen
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import XCTest

@testable import TienLen

class DeckTests: XCTestCase {

    let deck = Deck()

    func testInitialization() {
        XCTAssertEqual(deck.cards.count, 52)
    }
    
}
