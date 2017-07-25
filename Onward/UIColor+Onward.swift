//
//  UIColor+Onward.swift
//  TienLen
//
//  Created by Robert Edwards on 4/16/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import UIKit

extension UIColor {
    static var cardColor: UIColor {
        return UIColor(red: 0.9921,
                       green: 0.9647,
                       blue: 0.8941,
                       alpha: 1)
    }

    static var cardHighlightColor: UIColor {
        return UIColor(red:0.565,
                       green:0.463,
                       blue:0.294,
                       alpha: 1)
    }

    static var slateColor: UIColor {
        return UIColor(red:0.204,
                       green:0.200,
                       blue:0.200,
                       alpha: 1)
    }

    static var lightBrownColor: UIColor {
        return UIColor(red:0.424,
                       green:0.353,
                       blue:0.275,
                       alpha: 1)
    }

    static var darkBrownColor: UIColor {
        return UIColor(red:0.173,
                       green:0.137,
                       blue:0.133,
                       alpha: 1)
    }

    static var darkRedColor: UIColor {
        return UIColor(red:0.459,
                       green:0.000,
                       blue:0.094,
                       alpha: 1)
    }

    static func randomColor() -> UIColor {
        let r = CGFloat.random()
        let g = CGFloat.random()
        let b = CGFloat.random()

        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
