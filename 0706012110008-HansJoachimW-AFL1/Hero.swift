//
//  Hero.swift
//  0706012110008-HansJoachimW-AFL1
//
//  Created by MacBook Pro on 03/04/23.
//

import Foundation

struct Hero {
    var name: String
    
    var baseHealth: Int
    var bonusHealth: Int
    var currentHealth: Int
    var maxHealth: Int
    
    var baseMana: Int
    var bonusMana: Int
    var currentMana: Int
    var maxMana: Int
    
    var baseAttack: Int
    var bonusAttack: Int
    
    var potionAmount: Int
    var elixirAmount: Int
    var aegisAmount: Int
    
    var stash: [Equipment]
    
    init(name: String, baseHealth: Int, bonusHealth: Int, maxHealth: Int, baseMana: Int, bonusMana: Int, maxMana: Int, baseAttack: Int, bonusAttack: Int, potionAmount: Int, elixirAmount: Int, aegisAmount: Int, stash: [Equipment]) {
        self.name = name
        
        self.baseHealth = baseHealth
        self.bonusHealth = bonusHealth
        self.currentHealth = baseHealth + bonusHealth
        self.maxHealth = maxHealth
        
        self.baseMana = baseMana
        self.bonusMana = bonusMana
        self.currentMana = baseMana + bonusMana
        self.maxMana = maxMana
        
        self.baseAttack = baseAttack
        self.bonusAttack = bonusAttack
        
        self.potionAmount = potionAmount
        self.elixirAmount = elixirAmount
        self.aegisAmount = aegisAmount
        
        self.stash = stash
    }
    
    mutating func getCharacterInfo(){
        print("""
              Player name : \(name)
              Health: \(baseHealth)/\(maxHealth)
              Mana: \(baseMana)/\(maxMana)
              Magic:
                    - Physical Attack. No mana required. Deal \(baseAttack)pt of damage.
                    - Meteor. Use 15pt of MP. Deal \(baseAttack + bonusAttack)pt of damage.
                    - Shield. Use 10pt of MP. Negate damage taken from enemy's attack in 1 turn.
              Backpack:
                    - Potion x\(potionAmount). Heal 20pt of your MP.
                    - Elixir x\(elixirAmount). Add 10pt of your MP.
                    - Aegis x\(aegisAmount). Permanently add 20pt of your HP and MP.
              """)
    }

    mutating func decreaseHP(by point: Int) {
        baseHealth -= point
    }
}
