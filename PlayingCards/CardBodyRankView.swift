//
//  CardBodyRankView.swift
//  TienLen
//
//  Created by Robert Edwards on 4/30/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import UIKit

let DetailSuitViewGridColumnCount = 3
let DetailSuitViewGridRowCount = 7

class CardBodyRankView: UIView {

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
        let visibilityGrid = CardBodyRankView.suitVisibilityGrid(for: rank)
        for (columnIndex, column) in detailSuitViewGrid.enumerated() {
            for (rowIndex, detailView) in column.enumerated() {
                detailView.isHidden = !visibilityGrid[columnIndex][rowIndex]
                if !detailView.isHidden {
                    detailView.configure(suit: suit)
                }
            }
        }
    }

    private func setup() {
        backgroundColor = UIColor.red
        addSubviews()
        layoutDetailSuitViews()
    }

    private func addSubviews() {
        detailSuitViewGrid.joined().apply() {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }

    private func layoutDetailSuitViews() {
        // Detail View Height and Width
        detailSuitViewGrid.joined().apply() {
            let widthConstraint = NSLayoutConstraint(item: $0,
                                                     attribute: .width,
                                                     relatedBy: .equal,
                                                     toItem: self,
                                                     attribute: .width,
                                                     multiplier: (1 / CGFloat(DetailSuitViewGridColumnCount)),
                                                     constant: 0)
            let heightConstraint = NSLayoutConstraint(item: $0,
                                                      attribute: .height,
                                                      relatedBy: .equal,
                                                      toItem: self,
                                                      attribute: .height,
                                                      multiplier: (1 / CGFloat(DetailSuitViewGridRowCount)),
                                                      constant: 0)
            addConstraints([widthConstraint, heightConstraint])
        }

        // Horizontal Layout
        let columnOneHead = detailSuitViewGrid[0][0]
        let columnTwoHead = detailSuitViewGrid[1][0]
        let columnThreeHead = detailSuitViewGrid[2][0]
        columnOneHead.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        columnTwoHead.leadingAnchor.constraint(equalTo: columnOneHead.trailingAnchor).isActive = true
        columnThreeHead.leadingAnchor.constraint(equalTo: columnTwoHead.trailingAnchor).isActive = true

        // Vertical Layout
        for column in detailSuitViewGrid {
            for (index, suitView) in column.enumerated() {
                if index == column.indices.first {
                    suitView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
                    continue
                }
                let previousDetailView = column[index - 1]
                suitView.leadingAnchor.constraint(equalTo: previousDetailView.leadingAnchor).isActive = true
                let verticalConstraint = NSLayoutConstraint(item: suitView,
                                                            attribute: .top,
                                                            relatedBy: .equal,
                                                            toItem: previousDetailView,
                                                            attribute: .bottom,
                                                            multiplier: 1.0,
                                                            constant: 0)
                addConstraint(verticalConstraint)
            }
        }
    }
}

extension CardBodyRankView {
    static func suitVisibilityGrid(for rank: Rank) -> [[Bool]] {
        switch rank {
        case .ace:
            return [
                [false, false, false, false, false, false, false],
                [false, false, false, true, false, false, false],
                [false, false, false, false, false, false, false]
            ]

        case .ten:
            return [
                [true, false, true, false, true, false, true],
                [false, true, false, false, false, true, false],
                [true, false, true, false, true, false, true]
            ]

        case .nine:
            return [
                [true, false, true, false, true, false, true],
                [false, false, false, true, false, false, false],
                [true, false, true, false, true, false, true]
            ]

        case .eight:
            return [
                [true, false, false, true, false, false, true],
                [false, false, true, false, true, false, false],
                [true, false, false, true, false, false, true]
            ]

        case .seven:
            return [
                [true, false, false, false, false, false, true],
                [false, true, false, true, false, true, false],
                [true, false, false, false, false, false, true]
            ]

        case .six:
            return [
                [true, false, false, true, false, false, true],
                [false, false, false, false, false, false, false],
                [true, false, false, true, false, false, true]
            ]

        case .five:
            return [
                [true, false, false, false, false, false, true],
                [false, false, false, true, false, false, false],
                [true, false, false, false, false, false, true]
            ]

        case .four:
            return [
                [true, false, false, false, false, false, true],
                [false, false, false, false, false, false, false],
                [true, false, false, false, false, false, true]
            ]

        case .three:
            return [
                [false, false, false, false, false, false, false],
                [true, false, false, true, false, false, true],
                [false, false, false, false, false, false, false]
            ]

        case .two:
            return [
                [false, false, false, false, false, false, false],
                [true, false, false, false, false, false, true],
                [false, false, false, false, false, false, false]
            ]

        case .king, .queen, .jack:
            return [
                [false, false, false, false, false, false, false],
                [false, false, false, false, false, false, false],
                [false, false, false, false, false, false, false]
            ]
        }
    }
}

private class SuitDetailView: UIView {
    private lazy var imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())

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

        addSubview(imageView)

        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    func configure(suit: Suit) {
        switch suit {
        case .club:
            imageView.image = UIImage.club
        case .heart:
            imageView.image = UIImage.heart
        case .diamond:
            imageView.image = UIImage.diamond
        case .spade:
            imageView.image = UIImage.spade
        }
    }
}

extension UIImage {
    fileprivate static let heart = UIImage(named: "hearts", in: Bundle.playingCardsBundle, compatibleWith: nil)
    fileprivate static let spade = UIImage(named: "spades", in: Bundle.playingCardsBundle, compatibleWith: nil)
    fileprivate static let diamond = UIImage(named: "diamond", in: Bundle.playingCardsBundle, compatibleWith: nil)
    fileprivate static let club = UIImage(named: "clubs", in: Bundle.playingCardsBundle, compatibleWith: nil)
}

extension Bundle {
    private class PlayingCardsBundleMember {}
    public static var playingCardsBundle: Bundle {
        return Bundle(for: PlayingCardsBundleMember.self)
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
