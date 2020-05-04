//
//  ViewController.swift
//  Space Adventure iOS
//
//  Created by Niklas Arnitz on 28.04.20.
//  Copyright © 2020 Niklas Arnitz. All rights reserved.
//

import SnapKit
import UIKit

class ViewController: UIViewController {
    private lazy var leftCaptionLabel: UILabel = {
        let label: UILabel = .init(frame: .zero)
        label.text = "YOUR SHIP"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    private lazy var leftSpaceshipViewController: SpaceshipViewController = .init(
        spaceship: Spaceship(
            name: "U.S.S. ENTERPRISE",
            type: .constitutionClass
        )
    )
    private lazy var rightCaptionLabel: UILabel = {
        let label: UILabel = .init(frame: .zero)
        label.text = "ENCOUNTERED SHIP:"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    private lazy var rightSpaceshipViewController: SpaceshipViewController = .init(
        spaceship: Spaceship(
            name: "TEK'NOK",
            type: .birdOfPrey
        )
    )

    private lazy var leftVerticalStackView: UIStackView = {
        let stackView: UIStackView = .init(arrangedSubviews: [
            leftCaptionLabel,
            leftSpaceshipViewController.view
        ])
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var rightVerticalStackView: UIStackView = {
        let stackView: UIStackView = .init(arrangedSubviews: [
            rightCaptionLabel,
            rightSpaceshipViewController.view
        ])
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var horizontalstackView: UIStackView = {
        let stackView: UIStackView = .init(arrangedSubviews: [
            leftVerticalStackView,
            rightVerticalStackView
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()

    private lazy var controlViewController: ControlViewController = .init()

    private lazy var verticalStackView: UIStackView = {
        let stackView: UIStackView = .init(arrangedSubviews: [
            horizontalstackView,
            controlViewController.view
        ])
        stackView.axis = .vertical
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)

        flyInShips()
    }

    private func flyInShips() {
        leftVerticalStackView.frame = CGRect(
            x: -(leftVerticalStackView.bounds.width),
            y: 0, width: leftVerticalStackView.bounds.width,
            height: leftVerticalStackView.bounds.height
        )

        let rightX = rightVerticalStackView.frame.minX
        rightVerticalStackView.frame = CGRect(
            x: rightX + rightVerticalStackView.bounds.width,
            y: 0, width: rightVerticalStackView.bounds.width,
            height: rightVerticalStackView.bounds.height
        )

        UIView.animate(withDuration: 0.5) {
            self.leftVerticalStackView.frame = CGRect(
                x: 0,
                y: 0, width: self.leftVerticalStackView.bounds.width,
                height: self.leftVerticalStackView.bounds.height
            )
            self.rightVerticalStackView.frame = CGRect(
                x: rightX,
                y: 0, width: self.rightVerticalStackView.bounds.width,
                height: self.rightVerticalStackView.bounds.height
            )
        }
    }
}

