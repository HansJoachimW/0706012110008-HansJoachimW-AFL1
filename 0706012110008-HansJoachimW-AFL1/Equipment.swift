//
//  Equipment.swift
//  0706012110008-HansJoachimW-AFL1
//
//  Created by MacBook Pro on 03/04/23.
//

import Foundation

protocol Gear {
    func dropChance(chance: Int)
}

class Equipment {
    var name: String
    var tier: Int
    
    init (name: String, tier: Int) {
        self.name = name
        self.tier = tier
    }
    
    init (_ name: String, tier: Int) {
        self.name = name
        self.tier = tier
    }
    
    init (_ name: String) {
        self.name = name
        self.tier = 1
    }
    
    init (tier: Int) {
            self.name = ""
            self.tier = tier
    }
    
    func equip(by heroName: String) {
        if name.isEmpty {
            print("\(heroName) can't equipped unknown item")
        } else {
            print("\(heroName) equipped \(name)")
        }
    }
}

class AttackEquipment: Equipment, Gear {
    var bonusAttack: Int
    
    var description: String {
        return """
            Attack Equipment: \(name)
            Tier Level: \(tier)
            Bonus Attack: \(bonusAttack)
            """
    }
    
    init(_ name: String, tier: Int, bonus attackPoint: Int) {
        bonusAttack = attackPoint
        
        super.init(name, tier: tier)
    }
    
    func dropChance(chance: Int) {
        if chance <= 1 { // chance = 1 / 1000
            print("You have found an attack equipment.")
            equip(by: mainCharacter.name)
            mainCharacter.bonusAttack += bonusAttack
            print("You have equipped the item. You gain +\(bonusAttack) attack points.")
        }
    }
}

class DefenseEquipment: Equipment, Gear {
    var bonusHealth: Int
    
    var description: String {
        return """
            Defense Equipment: \(name)
            Tier Level: \(tier)
            Bonus Health: \(bonusHealth)
            """
    }
    
    init(_ name: String, tier: Int, bonus healthPoint: Int) {
        bonusHealth = healthPoint
        super.init(name, tier: tier)
    }
    
    func dropChance(chance: Int) {
        if chance <= 1 { // chance = 1 / 1000
            print("You have found a defense equipment.")
            equip(by: mainCharacter.name)
            mainCharacter.bonusHealth += bonusHealth
            print("You have equipped the item. You gain +\(bonusHealth) health points.")
        }
    }
}
