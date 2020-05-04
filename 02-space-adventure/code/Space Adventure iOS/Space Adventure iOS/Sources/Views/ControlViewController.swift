//
//  ControlViewController.swift
//  Space Adventure iOS
//
//  Created by Niklas Arnitz on 28.04.20.
//  Copyright © 2020 Niklas Arnitz. All rights reserved.
//

import UIKit

class ControlViewController: UIViewController {
    private lazy var messageLabel: UILabel = {
        let label: UILabel = .init(frame: .zero)
        label.text = "Command your ship, Sir!"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        return label
    }()

    private lazy var 

    private lazy var leftVerticalStackView: UIStackView = {
        let stackView: UIStackView = .init(arrangedSubviews: [
            messageLabel
        ])
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var rightVerticalStackView: UIStackView = {
        let stackView: UIStackView = .init(arrangedSubviews: [
            messageLabel
        ])
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var horizontalStackView: UIStackView = {
        let stackView: UIStackView = .init(arrangedSubviews: [
            leftVerticalStackView,
            rightVerticalStackView
        ])
        stackView.axis = .horizontal
        return stackView
    }()
    private lazy var verticalStackView: UIStackView = {
        let stackView: UIStackView = .init(arrangedSubviews: [
            messageLabel,
            horizontalStackView
        ])
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
}
