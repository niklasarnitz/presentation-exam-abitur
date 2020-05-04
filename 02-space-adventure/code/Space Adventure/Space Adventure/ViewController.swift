//
//  ViewController.swift
//  Space Adventure
//
//  Created by Niklas Arnitz on 22.04.20.
//  Copyright © 2020 Niklas Arnitz. All rights reserved.
//

import Cocoa
import SnapKit

class ViewController: NSViewController {
    private lazy var leftSpaceshipView: SpaceshipView = .init(frame: .zero)
    private lazy var rightSpaceshipView: SpaceshipView = .init(frame: .zero)

    private lazy var horizontalStackView: NSStackView = .init(views: [
        leftSpaceshipView,
        rightSpaceshipView
    ])

    override func viewDidLoad() {
        super.viewDidLoad()

        horizontalStackView.alignment = .firstBaseline
        horizontalStackView.orientation = .horizontal

        leftSpaceshipView.spaceship = Spaceship(name: "Enterprise", type: .sovereignClass)
        rightSpaceshipView.spaceship = Spaceship(name: "Ka'tuck", type: .birdOfPrey)

        view.addSubview(horizontalStackView)
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
