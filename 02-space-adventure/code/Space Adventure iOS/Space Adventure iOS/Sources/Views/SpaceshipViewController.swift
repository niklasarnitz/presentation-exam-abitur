//
//  SpaceshipView.swift
//  Space Adventure
//
//  Created by Niklas Arnitz on 22.04.20.
//  Copyright © 2020 Niklas Arnitz. All rights reserved.
//

import UIKit
import SnapKit

class SpaceshipViewController: UIViewController {
    var spaceship: Spaceship {
        didSet {
            updateView()
        }
    }

    private lazy var spaceshipImageView: UIImageView = .init(frame: .zero)
    private lazy var spaceshipNameLabel: UILabel = .init(frame: .zero)
    private lazy var spaceshipFactionLabel: UILabel = .init(frame: .zero)
    private lazy var spaceshipHullStrengthCaptionLabel: UILabel = {
        let label: UILabel = .init(frame: .zero)
        label.text = "Hull Strength"
        return label
    }()
    private lazy var spaceshipMinimalHullStrengthLabel: UILabel = {
        let label: UILabel = .init(frame: .zero)
        label.text = "0"
        return label
    }()
    private lazy var spaceshipHullStrengthIndicatorbar: UIProgressView = .init(progressViewStyle: .default)
    private lazy var spaceshipMaximalHullStrengthLabel: UILabel = .init(frame: .zero)

    private lazy var hullStrengthHorizontalStackView: UIStackView = .init(arrangedSubviews: [
        spaceshipMinimalHullStrengthLabel,
        spaceshipHullStrengthIndicatorbar,
        spaceshipMaximalHullStrengthLabel
    ])

    private lazy var spaceshipShieldStrengthCaptionLabel: UILabel = {
        let label: UILabel = .init(frame: .zero)
        label.text = "Hull Strength"
        return label
    }()
    private lazy var spaceshipMinimalShieldStrengthLabel: UILabel = {
        let label: UILabel = .init(frame: .zero)
        label.text = "0"
        return label
    }()
    private lazy var spaceshipShieldStrengthIndicatorbar: UIProgressView = .init(progressViewStyle: .default)
    private lazy var spaceshipMaximalShieldStrengthLabel: UILabel = .init(frame: .zero)

    private lazy var shieldStrengthHorizontalStackView: UIStackView = .init(arrangedSubviews: [
        spaceshipMinimalShieldStrengthLabel,
        spaceshipShieldStrengthIndicatorbar,
        spaceshipMaximalShieldStrengthLabel
    ])

    private lazy var verticalStackView: UIStackView = .init(arrangedSubviews: [
        spaceshipImageView,
        spaceshipNameLabel,
        spaceshipFactionLabel,
        spaceshipHullStrengthCaptionLabel,
        hullStrengthHorizontalStackView,
        shieldStrengthHorizontalStackView
    ])

    init(spaceship: Spaceship) {
        self.spaceship = spaceship

        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        updateView()

        view.addSubview(verticalStackView)

        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = 2.0
        view.layer.cornerRadius = 5.0

        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }

        spaceshipHullStrengthIndicatorbar.progressTintColor = .green
        spaceshipHullStrengthIndicatorbar.trackTintColor = .red

        spaceshipShieldStrengthIndicatorbar.progressTintColor = .green
        spaceshipShieldStrengthIndicatorbar.trackTintColor = .red

        hullStrengthHorizontalStackView.axis = .horizontal
        hullStrengthHorizontalStackView.alignment = .center
        hullStrengthHorizontalStackView.spacing = 20

        shieldStrengthHorizontalStackView.axis = .horizontal
        shieldStrengthHorizontalStackView.alignment = .center
        shieldStrengthHorizontalStackView.spacing = 20

        verticalStackView.axis = .vertical
        verticalStackView.spacing = 10
    }

    init() {
        spaceship = Spaceship(name: "", type: .sovereignClass)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateView() {
        spaceshipImageView.image = spaceship.type.image
        spaceshipNameLabel.text = "Ship Name: " + spaceship.name
        spaceshipFactionLabel.text = "Ship Faction: " + spaceship.type.faction.name
        spaceshipMaximalHullStrengthLabel.text = String(spaceship.type.hullStrength)
        spaceshipHullStrengthIndicatorbar.progress = spaceship.getHullPercentage()
        spaceshipMaximalShieldStrengthLabel.text = String(spaceship.type.shieldStrength)
        spaceshipShieldStrengthIndicatorbar.progress = spaceship.getShieldPercentage()
    }
}
