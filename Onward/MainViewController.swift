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

class MainViewController: UIViewController {

    @IBOutlet var cardView: CardView!

    override func viewDidLoad() {
        super.viewDidLoad()

        cardView.cardColor = UIColor.cardColor
        cardView.cardHighlightColor = UIColor.cardHighlightColor
        cardView.heartAndDiamondColor = UIColor.darkRedColor
        cardView.clubAndSpadeColor = UIColor.slateColor
        cardView.configure(.Ace, suit: .Heart)

        do {
            let myGame = try TienLen(numberOfPlayers: 2)
            for card in myGame.deck.cards {
                print(card)
            }
        } catch {
            print("\(error)")
        }
    }
}
