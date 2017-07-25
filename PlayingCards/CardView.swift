//
//  CardView.swift
//  TienLen
//
//  Created by Robert Edwards on 4/10/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import UIKit

open class CardView: UIView {

    // MARK: - Colors

    open var cardColor: UIColor = UIColor.white {
        didSet { setNeedsDisplay() }
    }
    open var cardHighlightColor: UIColor = UIColor.red {
        didSet { setNeedsDisplay() }
    }

    open var heartAndDiamondColor: UIColor = UIColor.red {
        didSet {
            switch suit {
            case .heart, .diamond:
                allLabels.apply() { $0.textColor = heartAndDiamondColor }
            default:
                break
            }
        }
    }
    open var clubAndSpadeColor: UIColor = UIColor.black {
        didSet {
            switch suit {
            case .club, .spade:
                allLabels.apply() { $0.textColor = clubAndSpadeColor }
            default:
                break
            }
        }
    }
    fileprivate var labelColor: UIColor {
        switch suit {
        case .club, .spade:
            return clubAndSpadeColor
        case .diamond, .heart:
            return heartAndDiamondColor
        }
    }

    // MARK: - Suit and Rank

    fileprivate var rank: Rank = .ace {
        didSet { rankDisplayValue = rank.description }
    }
    fileprivate var suit: Suit = .spade {
        didSet {
            allLabels.apply() { $0.textColor = labelColor }
            suitDisplayValue = suit.description
        }
    }
    fileprivate var rankDisplayValue: String = "" {
        didSet {
            rankLabels.apply() {
                $0.text = rankDisplayValue
                $0.sizeToFit()
            }
        }
    }
    fileprivate var suitDisplayValue: String = "" {
        didSet {
            suitLabels.apply() {
                $0.text = suitDisplayValue
                $0.sizeToFit()
            }
        }
    }

    override open var frame: CGRect {
        didSet {
            switch frame.width {
            case (0...100):
                allLabels.apply() { $0.font = UIFont.cardFont(size: 10.0) }
            default:
                allLabels.apply() { $0.font = UIFont.cardFont(size: 15.0) }
            }
        }
    }

    // MARK: - Subviews

    fileprivate let topLeftRankLabel = UILabel()
    fileprivate let topLeftSuitLabel = UILabel()
    fileprivate let bottomRightRankLabel = UILabel()
    fileprivate let bottomRightSuitLabel = UILabel()
    fileprivate let bodyRankView = CardBodyRankView()

    // MARK: - Lifecycle

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    open func configure(rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit

        bodyRankView.configure(rank: rank, suit: suit)
    }

    private func setup() {
        backgroundColor = UIColor.clear

        addSubviews()
        configureSuitAndRankViews()
        configureBodyView()
    }

    private func addSubviews() {
        allLabels.apply() {
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
    override open func draw(_ rect: CGRect) {
        super.draw(rect)

        drawCardBackground(rect)
        switch rank {
        case .king, .queen, .jack:
            drawInnerHollowRectangle(rect)
        default:
            break
        }
    }

    private func drawCardBackground(_ rect: CGRect) {
        cardColor.setFill()
        let card = UIBezierPath(roundedRect: rect,
                                cornerRadius: rect.width * CardView.cornerRadiusProportion)
        card.fill()
    }

    private func drawInnerHollowRectangle(_ rect: CGRect) {
        cardHighlightColor.setStroke()

        let subHeight = rect.height * CardView.innerRectProportion
        let dy = (rect.height - subHeight) / 2
        let dx = dy * CardView.rectHeightToWidthRatio
        let subRect = rect.insetBy(dx: dx, dy: dy)
        let hollowRect = UIBezierPath(roundedRect: subRect,
                                      cornerRadius: subRect.width * CardView.cornerRadiusProportion)
        hollowRect.lineWidth = subRect.width * CardView.cornerRadiusProportion
        hollowRect.stroke()
    }

    open override static var requiresConstraintBasedLayout: Bool {
        return true
    }
}

// MARK: - Constants

extension CardView {
    fileprivate static let cornerRadiusProportion: CGFloat = 0.0625
    fileprivate static let innerRectProportion: CGFloat = 0.55
    fileprivate static let rectHeightToWidthRatio: CGFloat = 0.719101124
    fileprivate static let labelPadding: CGFloat = 2
    fileprivate static let intrinsicHeight: CGFloat = 50
}

// MARK: - Subview Layout

extension CardView {
    fileprivate var suitLabels: [UILabel] {
        return [topLeftSuitLabel, bottomRightSuitLabel]
    }
    fileprivate var rankLabels: [UILabel] {
        return [topLeftRankLabel, bottomRightRankLabel]
    }
    fileprivate var allLabels: [UILabel] {
        return [suitLabels, rankLabels].flatMap() { $0 }
    }

    fileprivate func configureSuitAndRankViews() {
        topLeftRankLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        topLeftSuitLabel.centerXAnchor.constraint(equalTo: topLeftRankLabel.centerXAnchor).isActive = true
        topLeftRankLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor).isActive = true
        topLeftSuitLabel.topAnchor.constraint(equalTo: topLeftRankLabel.bottomAnchor).isActive = true

        let bottomLabels = [bottomRightRankLabel, bottomRightSuitLabel]
        bottomLabels.apply() {
            let transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            $0.transform = transform
        }
        bottomRightRankLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).isActive = true
        bottomRightSuitLabel.centerXAnchor.constraint(equalTo: bottomRightRankLabel.centerXAnchor).isActive = true
        bottomRightSuitLabel.bottomAnchor.constraint(equalTo: bottomRightRankLabel.topAnchor).isActive = true
        bottomRightRankLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor).isActive = true
    }

    fileprivate func configureBodyView() {
        bodyRankView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        bodyRankView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        let widthConstraint = NSLayoutConstraint(item: bodyRankView,
                                                 attribute: .width,
                                                 relatedBy: .equal,
                                                 toItem: self,
                                                 attribute: .width,
                                                 multiplier: CardView.innerRectProportion,
                                                 constant: 1)
        let heightConstraint = NSLayoutConstraint(item: bodyRankView,
                                                  attribute: .height,
                                                  relatedBy: .equal,
                                                  toItem: self,
                                                  attribute: .height,
                                                  multiplier: CardView.innerRectProportion,
                                                  constant: 1)
        addConstraints([widthConstraint, heightConstraint])
    }

    open override var intrinsicContentSize: CGSize {
        return CGSize(width: CardView.intrinsicHeight * CardView.rectHeightToWidthRatio,
                      height: CardView.intrinsicHeight)
    }
}

