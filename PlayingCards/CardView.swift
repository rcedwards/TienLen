//
//  CardView.swift
//  TienLen
//
//  Created by Robert Edwards on 4/10/16.
//  Copyright © 2016 Panko. All rights reserved.
//

import UIKit

public class CardView: UIView {

    public var cardColor: UIColor = [#Color(colorLiteralRed: 0.9921568627, green: 0.9647058824, blue: 0.8941176471, alpha: 1)#] {
        didSet { setNeedsDisplay() }
    }
    public var rank: String = "" {
        didSet {
            rankLabels.map() {
                $0.text = rank
                $0.sizeToFit()
            }
            setNeedsUpdateConstraints()
        }
    }
    public var suit: String = "" {
        didSet {
            suitLabels.map() {
                $0.text = suit
                $0.sizeToFit()
            }
            setNeedsUpdateConstraints()
        }
    }
    private var suitLabels: [UILabel] {
        return [topLeftSuitLabel, bottomRightSuitLabel]
    }
    private var rankLabels: [UILabel] {
        return [topLeftRankLabel, bottomRightRankLabel]
    }
    private var allLabels: [UILabel] {
        return [suitLabels, rankLabels].flatMap() { $0 }
    }
    private let topLeftRankLabel = UILabel()
    private let topLeftSuitLabel = UILabel()
    private let bottomRightRankLabel = UILabel()
    private let bottomRightSuitLabel = UILabel()

    private static let cornerRadiusProportion: CGFloat = 0.0625
    private static let innerRectProportion: CGFloat = 0.65
    private static let rectHeightToWidthRatio: CGFloat = 0.719101124
    private static let labelPadding: CGFloat = 2

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor.clearColor()

        addSubviews()
        configureSuitAndRankViews()
    }

    private func addSubviews() {
        allLabels.map() {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }

    private func configureSuitAndRankViews() {
        let topLabels = [topLeftRankLabel, topLeftSuitLabel]
        topLabels.map() {
            $0.leadingAnchor.constraintEqualToAnchor(layoutMarginsGuide.leadingAnchor).active = true
        }
        topLeftRankLabel.topAnchor.constraintEqualToAnchor(layoutMarginsGuide.topAnchor).active = true
        topLeftSuitLabel.topAnchor.constraintEqualToAnchor(topLeftRankLabel.bottomAnchor).active = true

        let bottomLabels = [bottomRightRankLabel, bottomRightSuitLabel]
        bottomLabels.map() {
            let transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
            $0.transform = transform
            $0.trailingAnchor.constraintEqualToAnchor(layoutMarginsGuide.trailingAnchor).active = true
        }
        bottomRightSuitLabel.bottomAnchor.constraintEqualToAnchor(bottomRightRankLabel.topAnchor).active = true
        bottomRightRankLabel.bottomAnchor.constraintEqualToAnchor(layoutMarginsGuide.bottomAnchor).active = true
    }

    override public func drawRect(rect: CGRect) {
        super.drawRect(rect)

        drawCardBackground(rect)
        drawInnerHollowRectangle(rect)
    }

    private func drawCardBackground(rect: CGRect) {
        cardColor.setFill()
        let card = UIBezierPath(roundedRect: rect,
                                cornerRadius: rect.width * CardView.cornerRadiusProportion)
        card.fill()
    }

    private func drawInnerHollowRectangle(rect: CGRect) {
        UIColor.redColor().setStroke()
        let innerHeight = rect.height * CardView.innerRectProportion
        let innerWidth = innerHeight * CardView.rectHeightToWidthRatio
        let innerX = (rect.width - innerWidth) / 2
        let innerY = (rect.height - innerHeight) / 2
        let subRect = CGRect(x: innerX,
                             y: innerY,
                             width: innerWidth,
                             height: innerHeight)
        let hollowRect = UIBezierPath(roundedRect: subRect,
                                      cornerRadius: innerWidth * CardView.cornerRadiusProportion)
        hollowRect.lineWidth = innerWidth * CardView.cornerRadiusProportion
        hollowRect.stroke()
    }
    
    public static override func requiresConstraintBasedLayout() -> Bool {
        return true
    }
}