//
//  SpaceshipView.swift
//  Space Adventure
//
//  Created by Niklas Arnitz on 22.04.20.
//  Copyright © 2020 Niklas Arnitz. All rights reserved.
//

import Cocoa
import SnapKit

class SpaceshipView: NSView {
    var spaceship: Spaceship {
        didSet {
            spaceshipHullStrengthIndicatorbar.maxValue = Double(spaceship.type.hullStrength)
            spaceshipHullStrengthIndicatorbar.doubleValue = Double(spaceship.type.hullStrength)
            spaceshipMaximalHullStrengthLabel.stringValue = String(spaceship.type.hullStrength)
            spaceshipNameLabel.stringValue = spaceship.name
            spaceshipImageView.image = spaceship.type.image
        }
    }

    private lazy var spaceshipNameLabel: NSTextField = .init(frame: .zero)
    private lazy var spaceshipImageView: NSImageView = .init(frame: .zero)
    private lazy var spaceshipHullStrengthCaptionLabel: NSTextField = .init(string: "Hull Strength")
    private lazy var spaceshipMinimalHullStrengthLabel: NSTextField = .init(string: "0")
    private lazy var spaceshipHullStrengthIndicatorbar: NSProgressIndicator = .init(frame: .zero)
    private lazy var spaceshipMaximalHullStrengthLabel: NSTextField = .init(frame: .zero)

    private lazy var hullStrengthHorizontalStackView: NSStackView = .init(views: [
        spaceshipMinimalHullStrengthLabel,
        spaceshipHullStrengthIndicatorbar,
        spaceshipMaximalHullStrengthLabel
    ])

    private lazy var verticalStackView: NSStackView = .init(views: [
        spaceshipNameLabel,
        spaceshipImageView,
        spaceshipHullStrengthCaptionLabel,
        hullStrengthHorizontalStackView
    ])

    init(spaceship: Spaceship) {
        self.spaceship = spaceship

        super.init(frame: .zero)

        spaceshipHullStrengthIndicatorbar.controlSize = .mini
        spaceshipHullStrengthIndicatorbar.minValue = 0
    }

    override func viewWillDraw() {
        addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        hullStrengthHorizontalStackView.orientation = .horizontal
        hullStrengthHorizontalStackView.alignment = .leading
        hullStrengthHorizontalStackView.spacing = 20

        verticalStackView.orientation = .vertical
    }

    override init(frame frameRect: NSRect) {
        spaceship = Spaceship(name: "", type: .sovereignClass)
        super.init(frame: frameRect)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
