//
//  MainViewController.swift
//  TienLen
//
//  Created by Robert Edwards on 4/11/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import UIKit

import PlayingCards
import TienLen

private let cardWidth: CGFloat = 86
private let cardHeight: CGFloat = 120
private let overlapMultiplier: CGFloat = 1.0 // 1.0 is no overlap 0.0 is full overlap
private let lineBreakAfter: Int = 4
private let padding: CGFloat = 2.0

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            let myGame = try TienLen(numberOfPlayers: 2)
            guard let firstHand = myGame.playerHands.first else {
                fatalError()
            }
            var nextCardRect = CGRect(x: 0, y: 40, width: cardWidth, height: cardHeight)
            var lineBreak = 0
            for card in firstHand.cards {
                view.addSubview(cardView(frame: nextCardRect, card: card))

                lineBreak += 1

                let dy: CGFloat
                let dx: CGFloat
                if lineBreak >= lineBreakAfter {
                    dy = cardHeight + padding
                    dx = -(CGFloat(lineBreakAfter - 1) * ((cardWidth * overlapMultiplier) + padding))
                    lineBreak = 0
                } else {
                    dy = 0
                    dx = (cardWidth * overlapMultiplier) + padding
                }
                nextCardRect = nextCardRect.offsetBy(dx: dx, dy: dy)
            }
        } catch {
            print("Failed to create game: \(error)")
        }
    }

    private func cardView(frame: CGRect, card: Card) -> CardView {
        let newCardView = CardView(frame: frame)
        newCardView.cardColor = UIColor.cardColor
        newCardView.cardHighlightColor = UIColor.cardHighlightColor
        newCardView.heartAndDiamondColor = UIColor.darkRedColor
        newCardView.clubAndSpadeColor = UIColor.slateColor
        newCardView.configure(rank: card.rank, suit: card.suit)
        return newCardView
    }
}
