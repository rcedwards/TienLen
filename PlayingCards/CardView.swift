//
//  CardView.swift
//  TienLen
//
//  Created by Robert Edwards on 4/10/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import UIKit

public class CardView: UIView {

    // MARK: - Colors

    public var cardColor: UIColor = UIColor.whiteColor() {
        didSet { setNeedsDisplay() }
    }
    public var cardHighlightColor: UIColor = UIColor.redColor() {
        didSet { setNeedsDisplay() }
    }

    public var heartAndDiamondColor: UIColor = UIColor.redColor() {
        didSet {
            switch suit {
            case .Heart, .Diamond:
                allLabels.map() { $0.textColor = heartAndDiamondColor }
            default:
                break
            }
        }
    }
    public var clubAndSpadeColor: UIColor = UIColor.blackColor() {
        didSet {
            switch suit {
            case .Club, .Spade:
                allLabels.map() { $0.textColor = clubAndSpadeColor }
            default:
                break
            }
        }
    }
    private var labelColor: UIColor {
        switch suit {
        case .Club, .Spade:
            return clubAndSpadeColor
        case .Diamond, .Heart:
            return heartAndDiamondColor
        }
    }

    // MARK: - Suit and Rank

    private var rank: Rank = .Ace {
        didSet { rankDisplayValue = rank.description }
    }
    private var suit: Suit = .Spade {
        didSet {
            allLabels.map() { $0.textColor = labelColor }
            suitDisplayValue = suit.description
        }
    }
    private var rankDisplayValue: String = "" {
        didSet {
            rankLabels.map() {
                $0.text = rankDisplayValue
                $0.sizeToFit()
            }
        }
    }
    private var suitDisplayValue: String = "" {
        didSet {
            suitLabels.map() {
                $0.text = suitDisplayValue
                $0.sizeToFit()
            }
        }
    }

    override public var frame: CGRect {
        didSet {
            switch frame.width {
            case (0...100):
                allLabels.map() { $0.font = UIFont.cardFont(10.0) }
            default:
                allLabels.map() { $0.font = UIFont.cardFont(15.0) }
            }
        }
    }

    // MARK: - Subviews

    private let topLeftRankLabel = UILabel()
    private let topLeftSuitLabel = UILabel()
    private let bottomRightRankLabel = UILabel()
    private let bottomRightSuitLabel = UILabel()
    private let bodyRankView = CardBodyRankView()

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
        backgroundColor = UIColor.clearColor()

        addSubviews()
        configureSuitAndRankViews()
        configureBodyView()
    }

    private func addSubviews() {
        allLabels.map() {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.textColor = labelColor
            addSubview($0)
        }
        addSubview(bodyRankView)
        bodyRankView.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Drawing

extension CardView {
    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)

        drawCardBackground(rect)
        switch rank {
        case .King, .Queen, .Jack:
            drawInnerHollowRectangle(rect)
        default:
            break
        }
    }

    private func drawCardBackground(rect: CGRect) {
        cardColor.setFill()
        let card = UIBezierPath(roundedRect: rect,
                                cornerRadius: rect.width * CardView.cornerRadiusProportion)
        card.fill()
    }

    private func drawInnerHollowRectangle(rect: CGRect) {
        cardHighlightColor.setStroke()

        let subHeight = rect.height * CardView.innerRectProportion
        let dy = (rect.height - subHeight) / 2
        let dx = dy * CardView.rectHeightToWidthRatio
        let subRect = CGRectInset(rect, dx, dy)
        let hollowRect = UIBezierPath(roundedRect: subRect,
                                      cornerRadius: subRect.width * CardView.cornerRadiusProportion)
        hollowRect.lineWidth = subRect.width * CardView.cornerRadiusProportion
        hollowRect.stroke()
    }

    public static override func requiresConstraintBasedLayout() -> Bool {
        return true
    }
}

// MARK: - Constants

extension CardView {
    private static let cornerRadiusProportion: CGFloat = 0.0625
    private static let innerRectProportion: CGFloat = 0.55
    private static let rectHeightToWidthRatio: CGFloat = 0.719101124
    private static let labelPadding: CGFloat = 2
    private static let intrinsicHeight: CGFloat = 50
}

// MARK: - Subview Layout

extension CardView {
    private var suitLabels: [UILabel] {
        return [topLeftSuitLabel, bottomRightSuitLabel]
    }
    private var rankLabels: [UILabel] {
        return [topLeftRankLabel, bottomRightRankLabel]
    }
    private var allLabels: [UILabel] {
        return [suitLabels, rankLabels].flatMap() { $0 }
    }

    private func configureSuitAndRankViews() {
        topLeftRankLabel.leadingAnchor.constraintEqualToAnchor(layoutMarginsGuide.leadingAnchor).active = true
        topLeftSuitLabel.centerXAnchor.constraintEqualToAnchor(topLeftRankLabel.centerXAnchor).active = true
        topLeftRankLabel.topAnchor.constraintEqualToAnchor(layoutMarginsGuide.topAnchor).active = true
        topLeftSuitLabel.topAnchor.constraintEqualToAnchor(topLeftRankLabel.bottomAnchor).active = true

        let bottomLabels = [bottomRightRankLabel, bottomRightSuitLabel]
        bottomLabels.map() {
            let transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            $0.transform = transform
        }
        bottomRightRankLabel.trailingAnchor.constraintEqualToAnchor(layoutMarginsGuide.trailingAnchor).active = true
        bottomRightSuitLabel.centerXAnchor.constraintEqualToAnchor(bottomRightRankLabel.centerXAnchor).active = true
        bottomRightSuitLabel.bottomAnchor.constraintEqualToAnchor(bottomRightRankLabel.topAnchor).active = true
        bottomRightRankLabel.bottomAnchor.constraintEqualToAnchor(layoutMarginsGuide.bottomAnchor).active = true
    }

    private func configureBodyView() {
        bodyRankView.centerXAnchor.constraintEqualToAnchor(centerXAnchor).active = true
        bodyRankView.centerYAnchor.constraintEqualToAnchor(centerYAnchor).active = true
        let widthConstraint = NSLayoutConstraint(item: bodyRankView,
                                                 attribute: .Width,
                                                 relatedBy: .Equal,
                                                 toItem: self,
                                                 attribute: .Width,
                                                 multiplier: CardView.innerRectProportion,
                                                 constant: 1)
        let heightConstraint = NSLayoutConstraint(item: bodyRankView,
                                                  attribute: .Height,
                                                  relatedBy: .Equal,
                                                  toItem: self,
                                                  attribute: .Height,
                                                  multiplier: CardView.innerRectProportion,
                                                  constant: 1)
        addConstraints([widthConstraint, heightConstraint])
    }
    
    public override func intrinsicContentSize() -> CGSize {
        return CGSize(width: CardView.intrinsicHeight * CardView.rectHeightToWidthRatio, height: CardView.intrinsicHeight)
    }
}

