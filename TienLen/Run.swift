//
//  Run.swift
//  TienLen
//
//  Created by Robert Edwards on 3/22/17.
//  Copyright © 2017 Panko. All rights reserved.
//

public struct Run {
    fileprivate static let MinimumRunCount = 3

    fileprivate var cards: [TienLen.Card]

    var isOfValidLength: Bool {
        return cards.count >= Run.MinimumRunCount
    }
}

extension Run: MutableCollection, RandomAccessCollection, ExpressibleByArrayLiteral, RangeReplaceableCollection {
    public typealias Index = Int
    public typealias Element = TienLen.Card
    public typealias SubSequence = ArraySlice<TienLen.Card>
    public typealias Indices = CountableRange<Int>

    public var startIndex: Int { return cards.startIndex }
    public var endIndex: Int { return cards.endIndex }
    public func index(after i: Int) -> Int { return cards.index(after: i) }
    public func index(of element: Element) -> Int? { return cards.firstIndex(of: element) }

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

    public init(arrayLiteral elements: Element...) {
        cards = elements
    }

    public mutating func replaceSubrange<C>(_ subrange: Range<Int>, with newElements: C) where C : Collection, TienLen.Card == C.Iterator.Element {
        cards.replaceSubrange(subrange, with: newElements)
    }

    public init() {
        fatalError()
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
