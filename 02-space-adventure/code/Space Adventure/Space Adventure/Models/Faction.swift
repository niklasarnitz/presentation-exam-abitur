//
//  Faction.swift
//  Space Adventure
//
//  Created by Niklas Arnitz on 22.04.20.
//  Copyright © 2020 Niklas Arnitz. All rights reserved.
//

import Foundation

enum Faction {
    case federation
    case klingon
    case ferengi
    case borg

    var name: String {
        switch self {
        case .federation:
            return "United Federation of Planets"

        case .klingon:
            return "Klingon Empire"

        case .ferengi:
            return "Ferengi Alliance"

        case .borg:
            return "Borg Collective"
        }
    }

    var alliedWith: [Faction] {
        switch self {
        case .federation:
            return [
                .federation,
                .ferengi,
                .klingon
            ]

        case .klingon:
            return [
                .federation,
                .ferengi,
                .klingon
            ]

        case .ferengi:
            return [
                .federation,
                .ferengi,
                .klingon
            ]

        case .borg:
            return [ .borg ]
        }
    }

    var enemyWith: [Faction] {
        switch self {
        case .federation:
            return [
                .borg
            ]

        case .klingon:
            return [
                .borg
            ]

        case .ferengi:
            return [
                .borg
            ]

        case .borg:
            return [
                .federation,
                .ferengi,
                .klingon
            ]
        }
    }
}
