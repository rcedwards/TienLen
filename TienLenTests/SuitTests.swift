//
//  SuitTests.swift
//  TienLen
//
//  Created by Robert Edwards on 2/13/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import XCTest

@testable import TienLen

class SuitTests: XCTestCase {
    
    func testSuitCount() {
        XCTAssertEqual(Suit.allSuits.count, 4)
    }
    
}
