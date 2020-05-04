//
//  SpaceShip.swift
//  Space Adventure
//
//  Created by Niklas Arnitz on 22.04.20.
//  Copyright © 2020 Niklas Arnitz. All rights reserved.
//

import Foundation

class Spaceship {
    var name: String
    var hullStrength: Int
    var shieldStrength: Int
    var phaserDamage: Int
    var type: SpaceshipType
    var isDestroyed: Bool {
        return (hullStrength <= 0) && (shieldStrength <= 0)
    }

    init(name: String, type: SpaceshipType) {
        self.name = name
        self.type = type
        self.hullStrength = type.hullStrength
        self.shieldStrength = type.shieldStrength
        self.phaserDamage = type.phaserDamage
    }

    func isAlliedWith(faction: Faction) -> Bool {
        return type.faction.alliedWith.contains(faction)
    }

    func getHullPercentage() -> Float {
        return Float(hullStrength) / Float(type.hullStrength)
    }

    func getShieldPercentage() -> Float {
        return Float(shieldStrength) / Float(type.shieldStrength)
    }

    func induceDamage(damage: Int) {
        if(shieldStrength <= 0) {
            hullStrength = hullStrength - damage
        } else if(shieldStrength > 0) {
            shieldStrength = shieldStrength - damage
        }
    }
}
