//
//  SpaceshipType.swift
//  Space Adventure
//
//  Created by Niklas Arnitz on 22.04.20.
//  Copyright © 2020 Niklas Arnitz. All rights reserved.
//

import Cocoa

enum SpaceshipType {
    case constitutionClass
    case intrepidClass
    case prometheusClass
    case sovereignClass

    case vorcha
    case birdOfPrey
    case dSeven

    case cube
    case sphere
    case diamond

    case marauder

    var faction: Faction {
        switch self {
        case .constitutionClass:
            return .federation

        case .intrepidClass:
            return .federation

        case .prometheusClass:
            return .federation

        case .sovereignClass:
            return .federation

        case .vorcha:
            return .klingon

        case .birdOfPrey:
            return .klingon

        case .dSeven:
            return .klingon

        case .cube:
            return .borg

        case .sphere:
            return .borg

        case .diamond:
            return .borg

        case .marauder:
            return .ferengi
        }
    }

    var hullStrength: Int {
        switch self {
        case .constitutionClass:
            return 19500

        case .intrepidClass:
            return 22500

        case .prometheusClass:
            return 31000

        case .sovereignClass:
            return 39000

        case .vorcha:
            return 30000

        case .birdOfPrey:
            return 10000

        case .dSeven:
            return 31500

        case .cube:
            return 42000

        case .sphere:
            return 12000

        case .diamond:
            return 15000

        case .marauder:
            return 15000
        }
    }

    var shieldStrength: Int {
        switch self {
        case .constitutionClass:
            return 3900

        case .intrepidClass:
            return 11250

        case .prometheusClass:
            return 15500

        case .sovereignClass:
            return 19500

        case .vorcha:
            return 15000

        case .birdOfPrey:
            return 5000

        case .dSeven:
            return 15750

        case .cube:
            return 500

        case .sphere:
            return 12000

        case .diamond:
            return 10000

        case .marauder:
            return 16000
        }
    }

    var phaserDamage: Int {
        switch self {
        case .constitutionClass:
            return 4

        case .intrepidClass:
            return 6

        case .prometheusClass:
            return 7

        case .sovereignClass:
            return 8

        case .vorcha:
            return 7

        case .birdOfPrey:
            return 3

        case .dSeven:
            return 8

        case .cube:
            return 5

        case .sphere:
            return 3

        case .diamond:
            return 3

        case .marauder:
            return 4
        }
    }

    var image: NSImage {
        switch self {
        case .constitutionClass:
            return NSImage(named: NSImage.Name("constitution"))!

        case .intrepidClass:
            return NSImage(named: NSImage.Name("intrepid"))!

        case .prometheusClass:
            return NSImage(named: NSImage.Name("prometheus"))!

        case .sovereignClass:
            return NSImage(named: NSImage.Name("sovereign"))!

        case .vorcha:
            return NSImage(named: NSImage.Name("vorcha"))!

        case .birdOfPrey:
            return NSImage(named: NSImage.Name("birdOfPrey"))!

        case .dSeven:
            return NSImage(named: NSImage.Name("dSeven"))!

        case .cube:
            return NSImage(named: NSImage.Name("cube"))!

        case .sphere:
            return NSImage(named: NSImage.Name("sphere"))!

        case .diamond:
            return NSImage(named: NSImage.Name("diamond"))!

        case .marauder:
            return NSImage(named: NSImage.Name("marauder"))!
        }
    }
}
