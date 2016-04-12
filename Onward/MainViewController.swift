//
//  MainViewController.swift
//  TienLen
//
//  Created by Robert Edwards on 4/11/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import UIKit

import PlayingCards

class MainViewController: UIViewController {

    @IBOutlet var cardView: CardView!

    override func viewDidLoad() {
        super.viewDidLoad()

        cardView.suit = "♠"
        cardView.rank = "K"
    }
}
