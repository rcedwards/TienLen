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


    override func viewDidLoad() {
        super.viewDidLoad()

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
