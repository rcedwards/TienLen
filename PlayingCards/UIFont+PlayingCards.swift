//
//  UIFont+PlayingCards.swift
//  TienLen
//
//  Created by Robert Edwards on 4/12/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import Foundation

extension UIFont {
    static func cardFont() -> UIFont {
        guard let font = UIFont(name: "AmericanTypewriter", size: 15.0) else {
            fatalError("Missing font")
        }
        return font
    }
}
