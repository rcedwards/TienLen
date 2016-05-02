//
//  CardBodyRankView.swift
//  TienLen
//
//  Created by Robert Edwards on 4/30/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import UIKit

private let DetailSuitViewGridColumnCount = 3
private let DetailSuitViewGridRowCount = 7

class CardBodyRankView: UIView {

    private var rank: Rank = .Ace {
        didSet {
        }
    }
    private var suit: Suit = .Spade {
        didSet {
        }
    }
    private lazy var detailSuitViewGrid: [[SuitDetailView]] = {
        var suitViews = [[SuitDetailView]]()
        for _ in 0..<DetailSuitViewGridColumnCount {
            var column = [SuitDetailView]()
            for _ in 0..<DetailSuitViewGridRowCount {
                column.append(SuitDetailView(frame: CGRect(x: 0, y: 0, width: 5, height: 10)))
            }
            suitViews.append(column)
        }
        return suitViews
    }()

    // MARK: - Lifecycle

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    public func configure(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }

    private func setup() {
        backgroundColor = UIColor.redColor()
        addSubviews()
        layoutDetailSuitViews()
    }

    private func addSubviews() {
        detailSuitViewGrid.flatten().map() {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }

    private func layoutDetailSuitViews() {
        // Detail View Height and Width
        detailSuitViewGrid.flatten().map() {
            let widthConstraint = NSLayoutConstraint(item: $0,
                attribute: .Width,
                relatedBy: .Equal,
                toItem: self,
                attribute: .Width,
                multiplier: (1 / CGFloat(DetailSuitViewGridColumnCount)),
                constant: 0)
            let heightConstraint = NSLayoutConstraint(item: $0,
                attribute: .Height,
                relatedBy: .Equal,
                toItem: self,
                attribute: .Height,
                multiplier: (1 / CGFloat(DetailSuitViewGridRowCount)),
                constant: 0)
            addConstraints([widthConstraint, heightConstraint])
        }

        // Horizontal Layout
        let columnOneHead = detailSuitViewGrid[0][0]
        let columnTwoHead = detailSuitViewGrid[1][0]
        let columnThreeHead = detailSuitViewGrid[2][0]
        columnOneHead.leadingAnchor.constraintEqualToAnchor(leadingAnchor).active = true
        columnTwoHead.leadingAnchor.constraintEqualToAnchor(columnOneHead.trailingAnchor).active = true
        columnThreeHead.leadingAnchor.constraintEqualToAnchor(columnTwoHead.trailingAnchor).active = true

        // Vertical Layout
        for column in detailSuitViewGrid {
            for (index, suitView) in column.enumerate() {
                if index == column.indices.first {
                    suitView.topAnchor.constraintEqualToAnchor(layoutMarginsGuide.topAnchor).active = true
                    continue
                }
                let previousDetailView = column[index - 1]
                suitView.leadingAnchor.constraintEqualToAnchor(previousDetailView.leadingAnchor).active = true
                let verticalConstraint = NSLayoutConstraint(item: suitView,
                                                            attribute: .Top,
                                                            relatedBy: .Equal,
                                                            toItem: previousDetailView,
                                                            attribute: .Bottom,
                                                            multiplier: 1.0,
                                                            constant: 0)
                addConstraint(verticalConstraint)
            }
        }
    }
}

private class SuitDetailView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        backgroundColor = UIColor.randomColor()
    }
}


// TODO: rcedwards REMOVE THIS. JUST FOR TESTING LAYOUT

extension UIColor {
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
