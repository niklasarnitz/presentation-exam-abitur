//
//  Player.swift
//  Space Adventure
//
//  Created by Niklas Arnitz on 22.04.20.
//  Copyright © 2020 Niklas Arnitz. All rights reserved.
//

import Foundation

class Player {
    var name: String
    var spaceShip: Spaceship
    var rank: Rank

    init(name: String, spaceShip: Spaceship, rank: Rank = .ensing) {
        self.name = name
        self.spaceShip = spaceShip
        self.rank = rank
    }
}

enum Rank {
    case ensing
    case lieutenant
    case lieutenantcommander
    case commander
    case captain
    case admiral

    var name: String {
        switch self {
        case .ensing:
            return "Ensing"
        case .lieutenant:
            return "Lieutenant"
        case .lieutenantcommander:
            return "Lieutenant Commander"
        case .commander:
            return "Commander"
        case .captain:
            return "Captain"
        case .admiral:
            return "Admiral"
        }
    }
}
