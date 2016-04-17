//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

import PlayingCards


let card = CardView(frame: CGRect(x: 0, y: 0, width: 144, height: 200))
card.configure(.Ace, suit: .Heart)

XCPlaygroundPage.currentPage.liveView = card
