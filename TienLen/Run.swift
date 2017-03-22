//
//  Run.swift
//  TienLen
//
//  Created by Robert Edwards on 3/22/17.
//  Copyright © 2017 Panko. All rights reserved.
//

public struct Run {
    static let MinimumRunCount = 3 // TODO: rcedwards enforce this in the initializer
    var cards: [TienLen.Card]
}

extension Run: MutableCollection, RandomAccessCollection, ExpressibleByArrayLiteral {
    public typealias Index = Int
    public typealias Element = TienLen.Card
    public typealias SubSequence = ArraySlice<TienLen.Card>
    public typealias Indices = CountableRange<Int>

    public var startIndex: Int { return cards.startIndex }
    public var endIndex: Int { return cards.endIndex }
    public func index(after i: Int) -> Int { return cards.index(after: i) }
    public func index(of element: Element) -> Int? { return cards.index(of: element) }

    public subscript(i: Int) -> TienLen.Card {
        get { return cards[i] }
        set { cards[i] = newValue }
    }

    public subscript(bounds: Range<Int>) -> ArraySlice<TienLen.Card> {
        get {
            return cards[bounds]
        }
        set(newValue) {
            cards[bounds] = newValue
        }
    }

    public mutating func append(_ card: TienLen.Card) {
        cards.append(card)
    }

    // TODO: rcedwards enforce sorting and minimum run card count here and valid run
    public init(arrayLiteral elements: Element...) {
        cards = elements
    }
}

extension Run: Comparable {}

public func <(lhs: Run, rhs: Run) -> Bool {
    guard let lhsTopCard = lhs.first, let rhsTopCard = rhs.first else {
        return false
    }
    return lhsTopCard < rhsTopCard
}

public func ==(lhs: Run, rhs: Run) -> Bool {
    guard lhs.cards.count == rhs.cards.count else {
        return false
    }

    for (index, card) in lhs.enumerated() {
        guard card == rhs[index] else {
            return false
        }
    }

    return true
}
